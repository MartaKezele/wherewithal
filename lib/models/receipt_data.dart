import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

import 'receipt_response.dart';

class ReceiptData {
  final XFile? imageFile;
  final PlatformFile? file;
  final ReceiptResponse? receiptResponse;

  ReceiptData({
    this.imageFile,
    this.file,
    this.receiptResponse,
  });
}
