import '../app_models/action_result.dart';
import '../l10n/app_localizations.dart';

ActionResult genericFailureResult(AppLocalizations localizations) =>
    ActionResult(
      success: false,
      messageTitle: localizations.genericErrorMsg,
    );
