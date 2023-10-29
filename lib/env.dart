import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'RECEIPT_RECOGNITION_API_KEY')
  static const String receiptRecognitionApiKey = _Env.receiptRecognitionApiKey;
}
