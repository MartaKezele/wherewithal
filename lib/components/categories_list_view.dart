import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:go_router/go_router.dart';

import '../app_models/types/firestore_category.dart';
import '../change_notifiers/currency.dart';
import '../constants/padding_size.dart';
import '../l10n/app_localizations.dart';
import '../models/enums/category_reasons.dart';
import 'error_content.dart';
import 'loading_content.dart';
import 'no_data_content.dart';

class CategoriesListView<T extends CategoryQuerySnapshotType>
    extends StatelessWidget with GetItMixin {
  CategoriesListView({
    super.key,
    required this.ref,
    this.nextRoutePathPart,
    this.scrollController,
    required this.foregroundColor,
  });

  final FirestoreListenable<T> ref;
  final String? nextRoutePathPart;
  final ScrollController? scrollController;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final String? currency = watchOnly(
      (CurrencyChangeNotifier changeNotifier) =>
          changeNotifier.currency?.symbol,
    );

    return FirestoreBuilder<T>(
      ref: ref,
      builder: (
        context,
        AsyncSnapshot<T> snapshot,
        Widget? child,
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

            if (category == null) {
              return ListTile(
                title: Text(
                  localizations.errorFetchingCategory,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onErrorContainer,
                      ),
                ),
              );
            }

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
              onTap: nextRoutePathPart == null
                  ? null
                  : () {
                      final routerState = GoRouterState.of(context);
                      context.push(
                        '${routerState.location}/$nextRoutePathPart/${category.id}',
                      );
                    },
            );
          },
        );
      },
    );
  }
}
