import 'package:device_info_plus/device_info_plus.dart';

Future<int> androidVersion() async {
  AndroidDeviceInfo android = await DeviceInfoPlugin().androidInfo;
  return android.version.sdkInt;
}
