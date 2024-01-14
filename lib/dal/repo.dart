import '../l10n/app_localizations.dart';

abstract class Repo {
  Repo(this.localizations);
  
  AppLocalizations localizations;
}
