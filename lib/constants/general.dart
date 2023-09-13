import '../app_models/action_result.dart';
import '../l10n/app_localizations.dart';

final genericFailureResult = ActionResult(
  success: false,
  messageTitle: AppLocalizations.ofCurrentContext().genericErrorMsg,
);
