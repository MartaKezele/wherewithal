class ReceiptProduct {
  static const valueField = 'value';
  static const productNameField = 'ProductName';
  static const productPriceField = 'ProductPrice';
  static const productQuantityField = 'ProductQuantity';

  final String productName;
  final double? productPrice;
  final double? quantity;

  ReceiptProduct({
    required this.productName,
    this.productPrice,
    this.quantity,
  });

  factory ReceiptProduct.fromJson(Map<String, dynamic> json) {
    return ReceiptProduct(
      productName: json[productNameField]?[valueField] ?? '',
      productPrice: double.tryParse(json[productPriceField]?[valueField] ?? ''),
      quantity: double.tryParse(json[productQuantityField]?[valueField] ?? ''),
    );
  }
}
