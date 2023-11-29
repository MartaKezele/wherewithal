import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../app_models/cron_recurrence_interval.dart';
import '../../../change_notifiers/currency.dart';
import '../../../change_notifiers/date_format.dart';
import '../../../components/custom_badge.dart';
import '../../../components/error_content.dart';
import '../../../components/loading_content.dart';
import '../../../components/no_data_content.dart';
import '../../../constants/padding_size.dart';
import '../../../models/enums/transaction_types.dart';
import '../../../models/models.dart' as models;
import '../../../extensions/build_context.dart';

class ValueTransactionsListView extends StatelessWidget with GetItMixin {
  ValueTransactionsListView({
    super.key,
    required this.ref,
    this.scrollController,
    this.filterFn,
    this.ctx,
  });

  final FirestoreListenable<models.ValueTransactionQuerySnapshot> ref;
  final ScrollController? scrollController;
  final List<models.ValueTransactionQueryDocumentSnapshot> Function(
      List<models.ValueTransactionQueryDocumentSnapshot>)? filterFn;
  final BuildContext? ctx;

  @override
  Widget build(BuildContext context) {
    final dateFormat = watchOnly(
      (DateFormatChangeNotifier changeNotifier) => changeNotifier.dateFormat,
    );

    final currency = watchOnly(
      (CurrencyChangeNotifier changeNotifier) =>
          changeNotifier.currency?.symbol,
    );

    return FirestoreBuilder(
      ref: ref,
      builder: (
        context,
        snapshot,
        child,
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

        if (filterFn != null) {
          filteredDocs = filterFn!(filteredDocs);
        }

        return ListView.builder(
          controller: scrollController,
          shrinkWrap: true,
          itemCount: filteredDocs.length,
          itemBuilder: (context, index) {
            final valueTransaction = filteredDocs[index].data;

            final transactionType = TransactionTypes.fromName(
              valueTransaction.categoryTransactionType,
            );

            final foregroundColor =
                transactionType?.foregroundColor(ctx ?? context);

            return ListTile(
              title: Text(
                valueTransaction.title ?? valueTransaction.categoryTitle,
              ),
              subtitle: Text(
                valueTransaction.cronExpression != null
                    ? CronRecurrenceInterval.fromCronExpression(
                          valueTransaction.cronExpression!,
                        ).localizedMessage(context) ??
                        ''
                    : dateFormat?.format(valueTransaction.dateTime) ?? '',
              ),
              leading: CustomBadge(
                title: valueTransaction.categoryTitle,
                backgroundColor: transactionType?.backgroundColor(context),
                foregroundColor: transactionType?.foregroundColor(context),
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
    );
  }
}
