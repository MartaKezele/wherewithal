import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../config/countries.dart';
import '../config/router.dart';
import 'messages_all.dart';

class AppLocalizations {
  AppLocalizations.fromLocale(this.localeName);

  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null || locale.countryCode!.isEmpty
            ? locale.languageCode
            : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      return AppLocalizations.fromLocale(localeName);
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static AppLocalizations ofCurrentContext() {
    assert(navigatorKey.currentContext != null);
    return Localizations.of<AppLocalizations>(
      navigatorKey.currentContext!,
      AppLocalizations,
    )!;
  }

  final String localeName;

  String get wherewithal {
    return Intl.message(
      'Wherewithal',
      locale: localeName,
      desc: 'App name (not to be translated in latin alphabets)',
    );
  }

  String get personalFinanceTracker {
    return Intl.message(
      'Personal finance tracker',
      locale: localeName,
    );
  }

  String get language {
    return Intl.message(
      'Language',
      locale: localeName,
    );
  }

  String get dark {
    return Intl.message(
      'Dark',
      locale: localeName,
    );
  }

  String get light {
    return Intl.message(
      'Light',
      locale: localeName,
    );
  }

  String get system {
    return Intl.message(
      'System',
      locale: localeName,
    );
  }

  String get password {
    return Intl.message(
      'Password',
      locale: localeName,
    );
  }

  String get email {
    return Intl.message(
      'Email',
      locale: localeName,
    );
  }

  String get profile {
    return Intl.message(
      'Profile',
      locale: localeName,
    );
  }

  String get dateFormat {
    return Intl.message(
      'Date format',
      locale: localeName,
    );
  }

  String get currency {
    return Intl.message(
      'Currency',
      locale: localeName,
    );
  }

  String get themeMode {
    return Intl.message(
      'Theme mode',
      locale: localeName,
    );
  }

  String get notifications {
    return Intl.message(
      'Notifications',
      locale: localeName,
    );
  }

  String get version {
    return Intl.message(
      'Version',
      locale: localeName,
    );
  }

  String get name {
    return Intl.message(
      'Name',
      locale: localeName,
    );
  }

  String get signInMethods {
    return Intl.message(
      'Sign in methods',
      locale: localeName,
    );
  }

  String get google {
    return Intl.message(
      'Google',
      locale: localeName,
    );
  }

  String get appPossibilitiesDescription {
    return Intl.message(
      'Track your expenses, gain insights and plan for the future to take charge of your finances',
      locale: localeName,
    );
  }

  String get dontSeeEmailMsg {
    return Intl.message(
      'Don\'t see the email? Check your spam folder',
      locale: localeName,
    );
  }

  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      locale: localeName,
    );
  }

  String get forgotPassword {
    return Intl.message(
      'Forgot password',
      locale: localeName,
    );
  }

  String get send {
    return Intl.message(
      'Send',
      locale: localeName,
    );
  }

  String get goBack {
    return Intl.message(
      'Go back',
      locale: localeName,
    );
  }

  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      locale: localeName,
    );
  }

  String get verifyEmail {
    return Intl.message(
      'Verify email',
      locale: localeName,
    );
  }

  String get continueMsg {
    return Intl.message(
      'Continue',
      locale: localeName,
    );
  }

  String get cancel {
    return Intl.message(
      'Cancel',
      locale: localeName,
    );
  }

  String get resendVerificationEmail {
    return Intl.message(
      'Resend verification email',
      locale: localeName,
    );
  }

  String get configurePassword {
    return Intl.message(
      'Configure password',
      locale: localeName,
    );
  }

  String get confirm {
    return Intl.message(
      'Confirm',
      locale: localeName,
    );
  }

  String get linkGoogleAccount {
    return Intl.message(
      'Link google account',
      locale: localeName,
    );
  }

  String get reauthenticateWithPassword {
    return Intl.message(
      'Reauthenticate with password',
      locale: localeName,
    );
  }

  String get retry {
    return Intl.message(
      'Retry',
      locale: localeName,
    );
  }

  String get reauthenticatingWithGoogle {
    return Intl.message(
      'Reauthenticating with google account',
      locale: localeName,
    );
  }

  String get reauthenticateWithGoogle {
    return Intl.message(
      'Reauthenticate with google account',
      locale: localeName,
    );
  }

  String get signIn {
    return Intl.message(
      'Sign in',
      locale: localeName,
    );
  }

  String get createAccount {
    return Intl.message(
      'Create account',
      locale: localeName,
    );
  }

  String get signOut {
    return Intl.message(
      'Sign out',
      locale: localeName,
    );
  }

  String get configure {
    return Intl.message(
      'Configure',
      locale: localeName,
    );
  }

  String get save {
    return Intl.message(
      'Save',
      locale: localeName,
    );
  }

  String get changePassword {
    return Intl.message(
      'Change password',
      locale: localeName,
    );
  }

  String get deleteAccount {
    return Intl.message(
      'Delete account',
      locale: localeName,
    );
  }

  String get delete {
    return Intl.message(
      'Delete',
      locale: localeName,
    );
  }

  String get forgotPasswordInstructions {
    return Intl.message(
      'Provide your email address and we will send you an email with instructions to reset your password',
      locale: localeName,
    );
  }

  String get verificationScreenInstructions {
    return Intl.message(
      'Follow the instructions in the verification email or click on the resend button',
      locale: localeName,
    );
  }

  String get verificationEmailSentMsg {
    return Intl.message(
      'A verification email has been sent to your email address, follow the instructions in the email to verify account.',
      locale: localeName,
    );
  }

  String get emailVerified {
    return Intl.message(
      'Email verified',
      locale: localeName,
    );
  }

  String get emailNotVerified {
    return Intl.message(
      'Email not verified',
      locale: localeName,
    );
  }

  String get tryAgainLater {
    return Intl.message(
      'Please try again later',
      locale: localeName,
    );
  }

  String get emailIsRequired {
    return Intl.message(
      'Email is required',
      locale: localeName,
    );
  }

  String get emailFormatIncorrect {
    return Intl.message(
      'Email format is incorrect',
      locale: localeName,
    );
  }

  String get passwordIsRequired {
    return Intl.message(
      'Password is required',
      locale: localeName,
    );
  }

  String get errorFetchingData {
    return Intl.message(
      'Error fetching data',
      locale: localeName,
    );
  }

  String get genericErrorMsg {
    return Intl.message(
      'Something unexpected happened. Please try again later.',
      locale: localeName,
    );
  }

  String get notSignedIn {
    return Intl.message(
      'You\'re not signed in',
      locale: localeName,
    );
  }

  String get invalidEmailErrorMsg {
    return Intl.message(
      'Email address is not valid',
      locale: localeName,
    );
  }

  String get userDisabledErrorMsg {
    return Intl.message(
      'Account associated with the given email has been disabled',
      locale: localeName,
    );
  }

  String get userNotFoundErrorMsg {
    return Intl.message(
      'There is no account associated with the given email',
      locale: localeName,
    );
  }

  String get wrondPasswordErrorMsg {
    return Intl.message(
      'The password is invalid',
      locale: localeName,
    );
  }

  String get networkRequestFailedErrorMsg {
    return Intl.message(
      'A network error has occured. Please check your internet connection and try again.',
      locale: localeName,
    );
  }

  String get emailAlreadyInUseErrorMsg {
    return Intl.message(
      'An account with the given email address already exists',
      locale: localeName,
    );
  }

  String get invalidCredentialErrorMsg {
    return Intl.message(
      'The credential is malformed or has expired',
      locale: localeName,
    );
  }

  String get operationNotAllowedErrorMsg {
    return Intl.message(
      'We don\'t support this sign in method yet. Try using another sign in method.',
      locale: localeName,
    );
  }

  String get userMismatchErrorMsg {
    return Intl.message(
      'The credential given does not correspond to the user',
      locale: localeName,
    );
  }

  String get providerAlreadyLinkedErrorMsg {
    return Intl.message(
      'The authentication provider is already linked to the account',
      locale: localeName,
    );
  }

  String get credentialAlreadyInUseErrorMsg {
    return Intl.message(
      'The account associated with the credential already exists, or is already linked to a user.',
      locale: localeName,
    );
  }

  String get invalidPasswordErrorMsg {
    return Intl.message(
      'The password is invalid',
      locale: localeName,
    );
  }

  String get requiresRecentLoginErrorMsg {
    return Intl.message(
      'You must reauthenticate to continue',
      locale: localeName,
    );
  }

  String get tooManyRequestsErrorMsg {
    return Intl.message(
      'You\'ve made too many requests in a short amount of time',
      locale: localeName,
    );
  }

  String get updatedYourInfo {
    return Intl.message(
      'Updated your information',
      locale: localeName,
    );
  }

  String get changedPassword {
    return Intl.message(
      'Changed password',
      locale: localeName,
    );
  }

  String get deletedAccount {
    return Intl.message(
      'Deleted account',
      locale: localeName,
    );
  }

  String get reloadedUser {
    return Intl.message(
      'Successfully reloaded user',
      locale: localeName,
    );
  }

  String get reauthenticated {
    return Intl.message(
      'Successfully reauthenticated',
      locale: localeName,
    );
  }

  String get linkedAccountWithCredentials {
    return Intl.message(
      'Successfully linked account with credentials',
      locale: localeName,
    );
  }

  String get signedIn {
    return Intl.message(
      'Successfully signed in',
      locale: localeName,
    );
  }

  String get createdAccount {
    return Intl.message(
      'Successfuly created account',
      locale: localeName,
    );
  }

  String get sendingVerificationEmailErrorTitle {
    return Intl.message(
      'Verification email could not be sent',
      locale: localeName,
    );
  }

  String get sendingVerificationEmailInvalidCredentials {
    return Intl.message(
      'Verification email could not be sent because you\'re not signed in/your credentials are not valid.',
      locale: localeName,
    );
  }

  String get sendingVerificationEmailEmailAlreadyVerified {
    return Intl.message(
      'Could not send verification email because email is already verified',
      locale: localeName,
    );
  }

  String get verificationEmailSent {
    return Intl.message(
      'A verification email has been sent',
      locale: localeName,
    );
  }

  String get verifyEmailInstructions {
    return Intl.message(
      'Click on the link in the email to verify your email address',
      locale: localeName,
    );
  }

  String get passwordResetEmailSent {
    return Intl.message(
      'Password reset email was sent, check your inbox.',
      locale: localeName,
    );
  }

  String get didntReceiveEmail {
    return Intl.message(
      'Didn\'t receive the email? Check your spam folder.',
      locale: localeName,
    );
  }

  String get signedOut {
    return Intl.message(
      'Successfully signed out',
      locale: localeName,
    );
  }

  String get signInProcessAborted {
    return Intl.message(
      'Sign in process was aborted',
      locale: localeName,
    );
  }

  String get accountIsntConfiguredWithGoogle {
    return Intl.message(
      'Account with the given email isn\'t configured to sign in with google',
      locale: localeName,
    );
  }

  String get accountNotFound {
    return Intl.message(
      'Account could not be found',
      locale: localeName,
    );
  }

  String get fetchedSignInMethods {
    return Intl.message(
      'Successfuly fetched sign in methods',
      locale: localeName,
    );
  }

  String get proccessAborted {
    return Intl.message(
      'Proccess aborted',
      locale: localeName,
    );
  }

  String get noConfiguredAuthProviders {
    return Intl.message(
      'There are no configured auth providers for account',
      locale: localeName,
    );
  }

  String get continueWithGoogle {
    return Intl.message(
      'Continue with google',
      locale: localeName,
    );
  }

  String get close {
    return Intl.message(
      'Close',
      locale: localeName,
    );
  }

  String get flagImage {
    return Intl.message(
      'Flag image',
      locale: localeName,
    );
  }

  String get insights {
    return Intl.message(
      'Insights',
      locale: localeName,
    );
  }

  String get recurringTransactions {
    return Intl.message(
      'Recurring transactions',
      locale: localeName,
    );
  }

  String get categories {
    return Intl.message(
      'Categories',
      locale: localeName,
    );
  }

  String get budget {
    return Intl.message(
      'Budget',
      locale: localeName,
    );
  }

  String get add {
    return Intl.message(
      'Add',
      locale: localeName,
    );
  }

  String get expense {
    return Intl.message(
      'Expense',
      locale: localeName,
    );
  }

  String get income {
    return Intl.message(
      'Income',
      locale: localeName,
    );
  }

  String get category {
    return Intl.message(
      'Category',
      locale: localeName,
    );
  }

  String get days {
    return Intl.message(
      'days',
      locale: localeName,
    );
  }

  String get weeks {
    return Intl.message(
      'weeks',
      locale: localeName,
    );
  }

  String get months {
    return Intl.message(
      'months',
      locale: localeName,
    );
  }

  String get years {
    return Intl.message(
      'years',
      locale: localeName,
    );
  }

  String get monday {
    return Intl.message(
      'Monday',
      locale: localeName,
    );
  }

  String get tuesday {
    return Intl.message(
      'Tuesday',
      locale: localeName,
    );
  }

  String get wednesday {
    return Intl.message(
      'Wednesday',
      locale: localeName,
    );
  }

  String get thursday {
    return Intl.message(
      'Thursday',
      locale: localeName,
    );
  }

  String get friday {
    return Intl.message(
      'Friday',
      locale: localeName,
    );
  }

  String get saturday {
    return Intl.message(
      'Saturday',
      locale: localeName,
    );
  }

  String get sunday {
    return Intl.message(
      'Sunday',
      locale: localeName,
    );
  }

  String get onMonday {
    return Intl.message(
      'on Monday',
      locale: localeName,
    );
  }

  String get onTuesday {
    return Intl.message(
      'on Tuesday',
      locale: localeName,
    );
  }

  String get onWednesday {
    return Intl.message(
      'on Wednesday',
      locale: localeName,
    );
  }

  String get onThursday {
    return Intl.message(
      'on Thursday',
      locale: localeName,
    );
  }

  String get onFriday {
    return Intl.message(
      'on Friday',
      locale: localeName,
    );
  }

  String get onSaturday {
    return Intl.message(
      'on Saturday',
      locale: localeName,
    );
  }

  String get onSunday {
    return Intl.message(
      'on Sunday',
      locale: localeName,
    );
  }

  String onDay(int day) {
    return Intl.message(
      'on day $day',
      locale: localeName,
      name: 'onDay',
      args: [day],
    );
  }

  String signInUsingMethods(String methods) {
    return Intl.message(
      'Sign in using one of the following methods: $methods. Once signed in you can configure sign in with google account in the profile section.',
      locale: localeName,
      name: 'signInUsingMethods',
      args: [methods],
    );
  }

  String weakPasswordErrorMsg(int minCharacters) {
    return Intl.message(
      'The password must contain at least $minCharacters characters',
      locale: localeName,
      name: 'weakPasswordErrorMsg',
      args: [minCharacters],
    );
  }

  String passwordCharactersRestrictionMsg(int min) {
    return Intl.message(
      'The password must contain at least $min characters',
      locale: localeName,
      name: 'passwordCharactersRestrictionMsg',
      args: [min],
    );
  }

  String minCharacters(int howMany) {
    return Intl.message(
      'Minimum $howMany characters',
      locale: localeName,
      name: 'minCharacters',
      args: [howMany],
    );
  }

  String repeatsEveryXDays(int howMany) {
    return Intl.plural(howMany,
        zero: 'Doesn\'t repeat',
        one: 'Repeats every day',
        other: 'Repeats every $howMany days',
        locale: localeName);
  }

  String repeatsEveryXWeeks(int howMany) {
    return Intl.plural(howMany,
        zero: 'Doesn\'t repeat',
        one: 'Repeats every week',
        other: 'Repeats every $howMany weeks',
        locale: localeName);
  }

  String repeatsEveryXMonths(int howMany) {
    return Intl.plural(howMany,
        zero: 'Doesn\'t repeat',
        one: 'Repeats every month',
        other: 'Repeats every $howMany months',
        locale: localeName);
  }

  String repeatsEveryXYears(int howMany) {
    return Intl.plural(howMany,
        zero: 'Doesn\'t repeat',
        one: 'Repeats every year',
        other: 'Repeats every $howMany years',
        locale: localeName);
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      countries.map((country) => country.language.locale).contains(locale);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
