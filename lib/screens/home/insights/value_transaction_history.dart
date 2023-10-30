import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../app_models/custom_dropdown_entry.dart';
import '../../../change_notifiers/auth.dart';
import '../../../change_notifiers/currency.dart';
import '../../../change_notifiers/date_format.dart';
import '../../../components/custom_badge.dart';
import '../../../components/dropdown/custom_dropdown.dart';
import '../../../components/error_content.dart';
import '../../../components/form/form_fields/date_range_form_field.dart';
import '../../../components/loading_content.dart';
import '../../../components/no_data_content.dart';
import '../../../config/date_time_picker.dart';
import '../../../constants/padding_size.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/enums/category_reasons.dart';
import '../../../models/enums/transaction_types.dart';
import '../../../models/models.dart' as models;
import '../../../extensions/build_context.dart';
import '../../../utils/dropdown/category_dropdown.dart';
import '../../../utils/dropdown/transaction_type_dropdown.dart';

class TransactionHistory extends StatefulWidget with GetItStatefulWidgetMixin {
  TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory>
    with GetItStateMixin {
  final _scrollController = ScrollController();

  DateTimeRange? _dateTimeRange = DateTimeRange(
    start: beginningOfThisWeek(),
    end: endOfThisWeek(),
  );
  List<TransactionTypes> _selectedTransactionTypes = [];
  List<CategoryReasons> _selectedCategoryReasons = [];
  List<models.Category> _selectedCategories = [];

  List<models.ValueTransactionQueryDocumentSnapshot>
      _filterTransactionsByTransactionTypes(
          List<models.ValueTransactionQueryDocumentSnapshot> filteredDocs) {
    if (_selectedTransactionTypes.isNotEmpty) {
      filteredDocs = filteredDocs
          .where(
            (element) => _selectedTransactionTypes.contains(
              TransactionTypes.fromName(
                element.data.categoryTransactionType,
              ),
            ),
          )
          .toList();
    }
    return filteredDocs;
  }

  List<models.ValueTransactionQueryDocumentSnapshot>
      _filterTransactionsByCategoryReasons(
    List<models.ValueTransactionQueryDocumentSnapshot> filteredDocs,
  ) {
    if (_selectedCategoryReasons.isNotEmpty) {
      filteredDocs = filteredDocs
          .where(
            (element) => _selectedCategoryReasons.contains(
              CategoryReasons.fromName(
                element.data.categoryReason,
              ),
            ),
          )
          .toList();
    }
    return filteredDocs;
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final currency = watchOnly(
      (CurrencyChangeNotifier changeNotifier) =>
          changeNotifier.currency?.symbol,
    );

    final dateFormat = watchOnly(
      (DateFormatChangeNotifier changeNotifier) => changeNotifier.dateFormat,
    );

    final userId = watchOnly(
      (AuthChangeNotifier changeNotifier) => changeNotifier.id,
    );

    models.ValueTransactionQuery valueTransactionsRef = models.usersRef
        .doc(userId)
        .valueTransactions
        .whereDateTime(
          isGreaterThanOrEqualTo: _dateTimeRange?.start,
          isLessThanOrEqualTo: _dateTimeRange?.end,
        )
        .orderByDateTime(
          descending: true,
        );

    models.CategoryQuery categoriesRef =
        models.usersRef.doc(userId).categories.orderByTitle();

    if (_selectedTransactionTypes.isNotEmpty) {
      categoriesRef = categoriesRef.whereTransactionType(
        whereIn: _selectedTransactionTypes
            .map((dropdownEntry) => dropdownEntry.name)
            .toList(),
      );
    }

    if (_selectedCategories.isNotEmpty) {
      valueTransactionsRef = valueTransactionsRef.whereCategoryId(
        whereIn: _selectedCategories
            .map((dropdownEntry) => dropdownEntry.id)
            .toList(),
      );
    }

    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(PaddingSize.md),
            child: Column(
              children: [
                DateRangeFormField(
                  setDateTimeRange: (dateTimeRange) {
                    setState(() {
                      _dateTimeRange = dateTimeRange;
                    });
                  },
                  dateTimeRange: _dateTimeRange,
                ),
                CustomDropdown<TransactionTypes>(
                  multiselect: true,
                  options: [
                    ...TransactionTypes.values
                        .map(
                          (transactionType) => CustomDropdownEntry(
                            value: transactionType,
                            title: transactionType.localizedName(context),
                            foregroundColor:
                                transactionType.foregroundColor(context),
                            backgroundColor:
                                transactionType.backgroundColor(context),
                          ),
                        )
                        .toList()
                  ],
                  selectedOptions: _selectedTransactionTypes
                      .map(
                        (transactionType) => transactionTypeDropdownEntry(
                          transactionType,
                          context,
                        ),
                      )
                      .toList(),
                  onSelectionChanged: (selection) {
                    final selectedTransactionTypeNames = selection
                        .map((dropdownEntry) => dropdownEntry.value.name);

                    setState(() {
                      _selectedTransactionTypes =
                          selection.map((element) => element.value).toList();
                      _selectedCategories.removeWhere(
                        (element) => !selectedTransactionTypeNames.contains(
                          element.transactionType,
                        ),
                      );
                    });
                  },
                  title: localizations.transactionType,
                ),
                FirestoreBuilder<models.CategoryQuerySnapshot>(
                  ref: categoriesRef,
                  builder: (
                    context,
                    AsyncSnapshot<models.CategoryQuerySnapshot> snapshot,
                    Widget? child,
                  ) {
                    if (snapshot.hasError) {
                      return Padding(
                        padding: const EdgeInsets.all(PaddingSize.md),
                        child: ErrorContent(
                          text: localizations.couldNotLoadCategoriesFilter,
                        ),
                      );
                    }

                    if (!snapshot.hasData) {
                      return const Padding(
                        padding: EdgeInsets.all(PaddingSize.md),
                        child: LoadingContent(),
                      );
                    }

                    final docs = snapshot.requireData.docs;

                    final baseCategories = docs.where(
                      (element) => element.data.parentCategoryId == null,
                    );

                    return CustomDropdown<models.Category>(
                      title: localizations.categories,
                      multiselect: true,
                      selectedOptions: _selectedCategories
                          .map((e) => categoryDropdownEntries(e, docs, context))
                          .toList(),
                      onSelectionChanged: (selection) {
                        setState(() {
                          _selectedCategories = selection
                              .map((element) => element.value)
                              .toList();
                        });
                      },
                      options: baseCategories.map((categoryDoc) {
                        return categoryDropdownEntries(
                          categoryDoc.data,
                          docs,
                          context,
                        );
                      }).toList(),
                    );
                  },
                ),
                Visibility(
                  visible: _selectedTransactionTypes.isEmpty ||
                      _selectedTransactionTypes.contains(
                        TransactionTypes.expense,
                      ),
                  child: CustomDropdown<CategoryReasons>(
                    multiselect: true,
                    options: [
                      ...CategoryReasons.values
                          .map(
                            (categoryReason) => CustomDropdownEntry(
                              value: categoryReason,
                              title: categoryReason.localizedName(context),
                            ),
                          )
                          .toList()
                    ],
                    selectedOptions: _selectedCategoryReasons
                        .map((element) => CustomDropdownEntry(
                              value: element,
                              title: element.localizedName(context),
                            ))
                        .toList(),
                    onSelectionChanged: (selection) {
                      final selectedCategoryReasonsNames = selection
                          .map((dropdownEntry) => dropdownEntry.value.name);

                      setState(() {
                        _selectedCategoryReasons =
                            selection.map((element) => element.value).toList();
                        _selectedCategories.removeWhere(
                          (element) => !selectedCategoryReasonsNames.contains(
                            element.transactionType,
                          ),
                        );
                      });
                    },
                    title: localizations.reasons,
                  ),
                ),
              ],
            ),
          ),
          FirestoreBuilder<models.ValueTransactionQuerySnapshot>(
            ref: valueTransactionsRef,
            builder: (
              context,
              AsyncSnapshot<models.ValueTransactionQuerySnapshot> snapshot,
              Widget? child,
            ) {
              if (snapshot.hasError) {
                return const Padding(
                  padding: EdgeInsets.all(PaddingSize.md),
                  child: ErrorContent(),
                );
              }

              if (!snapshot.hasData) {
                return const LoadingContent();
              }

              final docs = snapshot.requireData.docs;

              if (docs.isEmpty) {
                return const NoDataContent();
              }

              var filteredDocs = docs;

              filteredDocs =
                  _filterTransactionsByTransactionTypes(filteredDocs);
              filteredDocs = _filterTransactionsByCategoryReasons(filteredDocs);

              return ListView.builder(
                controller: _scrollController,
                shrinkWrap: true,
                itemCount: filteredDocs.length,
                itemBuilder: (context, index) {
                  final valueTransaction = filteredDocs[index].data;

                  final transactionType = TransactionTypes.fromName(
                    valueTransaction.categoryTransactionType,
                  );

                  final foregroundColor =
                      transactionType?.foregroundColor(context);

                  return ListTile(
                    title: Text(
                      valueTransaction.title ?? valueTransaction.categoryTitle,
                    ),
                    subtitle: Text(
                      dateFormat?.format(valueTransaction.dateTime) ?? '',
                    ),
                    leading: CustomBadge(
                      title: valueTransaction.categoryTitle,
                      backgroundColor:
                          transactionType?.backgroundColor(context),
                      foregroundColor:
                          transactionType?.foregroundColor(context),
                    ),
                    trailing: Text(
                      '${transactionType?.operand} ${valueTransaction.value.toString()} $currency',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: foregroundColor,
                          ),
                    ),
                    textColor: foregroundColor,
                    onTap: () => context.pushTransaction(valueTransaction.id),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
