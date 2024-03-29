import 'dart:async';

import 'package:collection/collection.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';

import '../models/models.dart' as models;
import '../app_models/action_result.dart';
import '../config/openai.dart';
import '../l10n/app_localizations.dart';
import '../models/receipt_product.dart';
import 'categories.dart';

const _productCategorizationSystemPrompt = """
Your task is to assign the single most suitable of the listed categories to each receipt item in the list.
Ensure accuracy, be as specific as possible, don't skip any items.

Here's an example of the user input:
Categories:
1. Food
2. Drinks
Shop name: Interspar
Receipt items:
1. potato
2. romerquelle
3. lettuce
4. gasoline

Here's an example of the expected response:
1. potato - Food (1)
2. romerquelle - Drinks (2)
3. lettuce - Food (1)
4. gasoline - Fuel (null)""";

Future<ActionResult<List<models.Category?>?>> productCategories(
  BuildContext context,
  List<models.Category> categories,
  List<ReceiptProduct> products,
  String? shopName,
) async {
  final localizations = AppLocalizations.of(context);
  final categoriesWithHierarchicalTitles =
      categoriesWitHierarchicalTitles(categories);

  try {
    final userMessage = categorizationUserMessage(
      categoriesWithHierarchicalTitles,
      products,
      shopName,
    );

    final chatModel = await OpenAI.instance.chat.create(
      model: openAiChatModel,
      temperature: 0,
      messages: [
        OpenAIChatCompletionChoiceMessageModel(
          role: OpenAIChatMessageRole.system,
          content: [
            OpenAIChatCompletionChoiceMessageContentItemModel.text(
              _productCategorizationSystemPrompt,
            ),
          ],
        ),
        OpenAIChatCompletionChoiceMessageModel(
          role: OpenAIChatMessageRole.user,
          content: [
            OpenAIChatCompletionChoiceMessageContentItemModel.text(userMessage),
          ],
        ),
      ],
    );

    final productCategories = parseProductCategories(
      chatModel,
      categoriesWithHierarchicalTitles,
      categories,
    );

    return ActionResult(
      success: true,
      messageTitle: localizations.detectedCategoriesForProducts,
      data: productCategories,
    );
  } on RequestFailedException catch (_) {
    return ActionResult(
      success: false,
      messageTitle: localizations.requestFailed,
    );
  } on TimeoutException catch (_) {
    return ActionResult(
      success: false,
      messageTitle: localizations.categorizationRequestTimedOut,
    );
  } catch (_) {
    return ActionResult(
      success: false,
      messageTitle: localizations.genericErrorMsg,
    );
  }
}

String categorizationUserMessage(
    List<models.Category> categoriesWithHierarchicalTitles,
    List<ReceiptProduct> products,
    String? shopName) {
  final categoryTitles = categoriesWithHierarchicalTitles
      .mapIndexed((index, element) => '${index + 1}. ${element.title}');
  final categoryTitlesStr = 'Categories:\n${categoryTitles.join('\n')}';

  final productTitles = products
      .mapIndexed((index, element) => '${index + 1}. ${element.productName}');
  final productTitlesStr = 'Receipt products:\n${productTitles.join('\n')}';

  return '$categoryTitlesStr\nShop name: $shopName\n$productTitlesStr';
}

List<models.Category?>? parseProductCategories(
  OpenAIChatCompletionModel chatModel,
  List<models.Category> categoriesWithHierarchicalTitles,
  List<models.Category> categories,
) {
  List<models.Category?>? productCategories;
  if (chatModel.choices.isNotEmpty) {
    final responseMsg = chatModel.choices.first.message;
    if (responseMsg.role == OpenAIChatMessageRole.assistant &&
        responseMsg.haveContent &&
        responseMsg.content?.isNotEmpty == true) {
      final content = responseMsg.content!.first.text;
      if (content != null && content.isNotEmpty) {
        productCategories = [];
        final productsWithCategories = content.split('\n');
        for (final element in productsWithCategories) {
          final categoryIdxStart = element.lastIndexOf('(');
          final categoryIdxEnd = element.lastIndexOf(')');
          final categoryIdx = int.tryParse(
            element.substring(categoryIdxStart + 1, categoryIdxEnd),
          );
          if (categoryIdx != null) {
            final hierarchicalCategory =
                categoriesWithHierarchicalTitles.elementAt(categoryIdx - 1);
            final category = categories
                .firstWhere((element) => element.id == hierarchicalCategory.id);
            productCategories.add(category);
          } else {
            productCategories.add(null);
          }
        }
      }
    }
  }
  return productCategories;
}
