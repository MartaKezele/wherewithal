import 'package:image_picker/image_picker.dart';

import 'receipt_response.dart';

class ReceiptData {
  final XFile imageFile;
  final ReceiptResponse? receiptResponse;

  ReceiptData({
    required this.imageFile,
    this.receiptResponse,
  });
}
