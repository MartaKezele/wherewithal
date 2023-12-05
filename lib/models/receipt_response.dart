import 'receipt_product.dart';

class ReceiptResponse {
  static const generalField = 'general';
  static const valueField = 'value';
  static const dateField = 'Date';
  static const timeField = 'Time';
  static const productItemsField = 'productItems';
  static const httpCodeField = 'httpCode';
  static const messageCodeField = 'messageCode';

  final int? httpCode;
  final int? messageCode;
  final DateTime? dateTime;
  final List<ReceiptProduct>? productItems;

  ReceiptResponse({
    this.httpCode,
    this.messageCode,
    this.dateTime,
    this.productItems,
  });

  factory ReceiptResponse.fromJson({
    required Map<String, dynamic> json,
    required String fileName,
  }) {
    final dateStr = json[generalField]?[dateField]?[valueField];
    final timeStr = json[generalField]?[timeField]?[valueField];
    final productItemsJson = json[productItemsField];

    final List<ReceiptProduct> productItems = [];
    for (final productItem in productItemsJson) {
      productItems.add(ReceiptProduct.fromJson(productItem));
    }

    return ReceiptResponse(
      httpCode: json[httpCodeField],
      messageCode: json[messageCodeField],
      dateTime: DateTime.tryParse('$dateStr $timeStr'),
      productItems: productItems,
    );
  }
}
