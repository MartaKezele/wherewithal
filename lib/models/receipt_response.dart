import 'receipt_product.dart';

class ReceiptResponse {
  static const _generalField = 'general';
  static const _valueField = 'value';
  static const _dateField = 'Date';
  static const _timeField = 'Time';
  static const _shopNameField = 'ShopName';
  static const _productItemsField = 'productItems';
  static const _httpCodeField = 'httpCode';
  static const _messageCodeField = 'messageCode';
  static const _languagesField = 'languages';
  static const _mainLanguageField = 'mainLanguage';

  final int? httpCode;
  final int? messageCode;
  final DateTime? dateTime;
  final String? shopName;
  final String? mainLanguage;
  final List<String>? languages;
  final List<ReceiptProduct>? productItems;

  ReceiptResponse({
    this.httpCode,
    this.messageCode,
    this.dateTime,
    this.productItems,
    this.shopName,
    this.mainLanguage,
    this.languages,
  });

  factory ReceiptResponse.fromJson({
    required Map<String, dynamic> json,
    required String fileName,
  }) {
    final dateStr = json[_generalField]?[_dateField]?[_valueField];
    final timeStr = json[_generalField]?[_timeField]?[_valueField];
    final productItemsJson = json[_productItemsField];
    final languagesJson = json[_languagesField];

    final List<ReceiptProduct> productItems = [];
    for (final productItem in productItemsJson) {
      productItems.add(ReceiptProduct.fromJson(productItem));
    }

    final List<String> languages = [];
    for (final language in languagesJson) {
      languages.add(language.toString());
    }

    return ReceiptResponse(
      httpCode: json[_httpCodeField],
      messageCode: json[_messageCodeField],
      dateTime: DateTime.tryParse('$dateStr $timeStr'),
      shopName: json[_generalField]?[_shopNameField]?[_valueField],
      productItems: productItems,
      languages: languages,
      mainLanguage: json[_mainLanguageField],
    );
  }
}
