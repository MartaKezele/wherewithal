import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../change_notifiers/currency.dart';
import '../../../constants/padding_size.dart';
import '../../../models/enums/category_reasons.dart';
import '../../../models/models.dart' as models;
import '../../../components/error_content.dart';
import '../../../components/loading_content.dart';
import '../../../components/no_data_content.dart';
import '../../../../../extensions/build_context.dart';

class CategoriesListView extends StatelessWidget with GetItMixin {
  CategoriesListView({
    super.key,
    required this.ref,
    this.scrollController,
    required this.foregroundColor,
  });

  final FirestoreListenable<models.CategoryQuerySnapshot> ref;
  final ScrollController? scrollController;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    final String? currency = watchOnly(
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
          return LoadingContent(color: foregroundColor);
        }

        final docs = snapshot.requireData.docs;

        if (docs.isEmpty) {
          return const NoDataContent();
        }

        return ListView.builder(
          shrinkWrap: true,
          controller: scrollController,
          itemCount: docs.length,
          itemBuilder: (context, index) {
            final category = docs[index].data;

            final categoryNeedString =
                CategoryReasons.fromName(category.categoryReason)
                        ?.localizedName(context) ??
                    '';

            return ListTile(
              title: Text(category.title),
              subtitle: Text(categoryNeedString),
              trailing: category.budget != null
                  ? Text(
                      '${category.budget.toString()} $currency',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: foregroundColor,
                          ),
                    )
                  : null,
              textColor: foregroundColor,
              onTap: () => context.pushCategory(category.id),
            );
          },
        );
      },
    );
  }
}
