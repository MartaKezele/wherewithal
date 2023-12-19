import 'dart:async';

import 'package:collection/collection.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';

import '../models/models.dart' as models;
import '../app_models/action_result.dart';
import '../config/openai.dart';
import '../l10n/app_localizations.dart';
import '../models/receipt_product.dart';

const _productCategorizationSystemPrompt = """
Your task is to assign the single most suitable of the listed categories to each receipt item in the list. Ensure accuracy, be as specific as possible, don't skip any items.

Here's an example:
User input:
Categories:
1. Food
2. Drinks
Shop name: Interspar
Receipt items:
1. potato
2. romerquelle
3. lettuce
4. gasoline

Assistant output:
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
  try {
    final categoryTitles = categories
        .mapIndexed((index, element) => '${index + 1}. ${element.title}');
    final categoryTitlesStr = 'Categories:\n${categoryTitles.join('\n')}';

    final productTitles = products
        .mapIndexed((index, element) => '${index + 1}. ${element.productName}');
    final productTitlesStr = 'Receipt products:\n${productTitles.join('\n')}';

    final inputStr = '$categoryTitlesStr\nShop name: $shopName\n$productTitlesStr';
    
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
            OpenAIChatCompletionChoiceMessageContentItemModel.text(inputStr),
          ],
        ),
      ],
    );

    List<models.Category?>? productCategories;

    if (chatModel.choices.isNotEmpty) {
      final responseMessage = chatModel.choices.first.message;
      if (responseMessage.role == OpenAIChatMessageRole.assistant &&
          responseMessage.haveContent &&
          responseMessage.content?.isNotEmpty == true) {
        final content = responseMessage.content!.first.text;
        if (content != null && content.isNotEmpty) {
          productCategories = [];
          final productsWithCategories = content.split('\n');
          for (final element in productsWithCategories) {
            final categoryIndexStart = element.lastIndexOf('(');
            final categoryIndexEnd = element.lastIndexOf(')');
            final categoryIndex = int.tryParse(
                element.substring(categoryIndexStart + 1, categoryIndexEnd));
            if (categoryIndex != null) {
              productCategories.add(categories.elementAt(categoryIndex - 1));
            } else {
              productCategories.add(null);
            }
          }
        }
      }
    }

    return ActionResult(
      success: true,
      messageTitle: localizations.detectedCategoriesForProducts,
      data: productCategories,
    );
  } on RequestFailedException catch (_) {
    return ActionResult(
      success: true,
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
