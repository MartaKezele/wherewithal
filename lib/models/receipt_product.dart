class ReceiptProduct {
  static const _valueField = 'value';
  static const _productNameField = 'ProductName';
  static const _productPriceField = 'ProductPrice';
  static const _productQuantityField = 'ProductQuantity';

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
      productName: json[_productNameField]?[_valueField] ?? '',
      productPrice:
          double.tryParse(json[_productPriceField]?[_valueField] ?? ''),
      quantity:
          double.tryParse(json[_productQuantityField]?[_valueField] ?? ''),
    );
  }
}
