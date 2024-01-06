import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../app_models/action_result.dart';
import '../app_models/product_item_data.dart';
import '../change_notifiers/auth.dart';
import '../l10n/app_localizations.dart';
import '../models/enums/transaction_types.dart';
import '../models/models.dart' as models;
import '../models/receipt_product.dart';
import 'openai.dart';

Future<ActionResult> categorizeProductItems({
  required BuildContext context,
  required String? shopName,
  required List<ProductItemData> items,
  required void Function(VoidCallback fn) setStateFn,
}) async {
  final localizations = AppLocalizations.of(context);
  final categoriesQuerySnapshot = await models.usersRef
      .doc(GetIt.I<AuthChangeNotifier>().id)
      .categories
      .whereTransactionType(isEqualTo: TransactionTypes.expense.name)
      .get();

  if (categoriesQuerySnapshot.docs.isEmpty) {
    return ActionResult(
      success: false,
      messageTitle: localizations.noCategories,
      messageDescription: localizations.addAFewCategoriesAndTryAgain,
    );
  }
  if (items.isEmpty) {
    return ActionResult(
      success: false,
      messageTitle: localizations.noProductItems,
      messageDescription: localizations.addAFewItemsAndTryAgain,
    );
  }

  final categories = categoriesQuerySnapshot.docs.map((doc) => doc.data);

  // ignore: use_build_context_synchronously
  final result = await productCategories(
    context,
    categories.toList(),
    items
        .map(
          (item) => ReceiptProduct(
            productName: item.titleController.text,
            productPrice: double.tryParse(item.priceController.text),
            quantity: item.quantity,
          ),
        )
        .toList(),
    shopName,
  );

  if (result.success && result.data != null) {
    final productCategories = result.data!;
    assert(productCategories.length == items.length);

    setStateFn(() {
      for (var i = 0; i < items.length; i++) {
        items[i].category = productCategories.elementAt(i);
      }
    });

    return ActionResult(
      success: true,
      messageTitle: localizations.detectedCategoriesForProducts,
    );
  } else {
    return result;
  }
}
