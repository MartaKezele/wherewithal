import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../app_models/action_result.dart';
import '../constants/receipt_processing_api.dart';
import '../env.dart';
import '../l10n/app_localizations.dart';
import '../models/receipt_api_quota_data.dart';
import '../models/receipt_data.dart';
import '../models/receipt_response.dart';

Future<List<ActionResult<ReceiptData?>>> processReceiptFiles({
  List<PlatformFile>? files,
  List<XFile>? imageFiles,
  required AppLocalizations localizations,
}) async {
  List<ActionResult<ReceiptData?>> results = [];
  final client = http.Client();

  if (files != null) {
    for (final file in files) {
      final result = await processReceiptFile(
        client: client,
        file: file,
        localizations: localizations,
      );
      results.add(result);
    }
  }

  if (imageFiles != null) {
    for (final imageFile in imageFiles) {
      final result = await processReceiptFile(
        client: client,
        imageFile: imageFile,
        localizations: localizations,
      );
      results.add(result);
    }
  }

  client.close();
  return results;
}

Future<ActionResult<ReceiptData?>> processReceiptFile({
  http.Client? client,
  PlatformFile? file,
  XFile? imageFile,
  required AppLocalizations localizations,
}) async {
  if (file != null && file.path == null) {
    return ActionResult(
      success: false,
      messageTitle: localizations.fileIsNotSavedOnDisk,
    );
  }

  // Checking if receipt api quota is reached
  final receiptApiQuotaResult = await _receiptRecognitionQuota(localizations);
  if (receiptApiQuotaResult.success && receiptApiQuotaResult.data != null) {
    final data = receiptApiQuotaResult.data!;

    if (data.quotaUsed >= data.quota) {
      return ActionResult(
        success: false,
        messageTitle: localizations.receiptProcessingQuotaHasBeenReached,
      );
    }
  }

  final failureActionResult = ActionResult(
    success: false,
    messageTitle: localizations.failedToProcessReceipt,
    data: ReceiptData(
      file: file,
    ),
  );

  try {
    final url = Uri.parse(receiptProcessingEndpoint);

    final request = http.MultipartRequest(
      'POST',
      url,
    )..headers.addAll({
        apiKeyParam: Env.receiptRecognitionApiKey,
      });

    if (file != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          fileParam,
          file.path!,
          filename: file.name,
        ),
      );
    }

    if (imageFile != null) {
      request.files.add(
        http.MultipartFile.fromBytes(
          fileParam,
          await imageFile.readAsBytes(),
          filename: imageFile.name,
        ),
      );
    }

    final response =
        client != null ? await client.send(request) : await request.send();

    if (response.statusCode == 200) {
      final responseString = await response.stream.bytesToString();

      final receiptResponse = ReceiptResponse.fromJson(
        json: jsonDecode(responseString),
        fileName: file?.name ?? imageFile?.name ?? '',
      );

      return ActionResult(
        success: true,
        messageTitle: localizations.dataExtracted,
        data: ReceiptData(
          file: file,
          receiptResponse: receiptResponse,
        ),
      );
    } else {
      return failureActionResult;
    }
  } catch (e) {
    return failureActionResult;
  }
}

Future<ActionResult<ReceiptApiQuotaData?>> _receiptRecognitionQuota(
  AppLocalizations localizations,
) async {
  final url = Uri.parse(receiptProcessingQuotaEndpoint);

  final failureResult = ActionResult<ReceiptApiQuotaData?>(
    success: false,
    messageTitle: localizations.failureFetchingReceiptRecognitionQuota,
  );

  try {
    final response = await http.get(url, headers: {
      apiKeyParam: Env.receiptRecognitionApiKey,
    });

    if (response.statusCode == 200) {
      final decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

      return ActionResult(
        success: true,
        messageTitle: localizations.fetchedReceiptRecognitionQuota,
        data: ReceiptApiQuotaData.fromJson(decodedResponse),
      );
    } else {
      return failureResult;
    }
  } catch (_) {
    return failureResult;
  }
}
