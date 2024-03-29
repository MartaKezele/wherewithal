import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../config/countries.dart';
import '../config/fraction_digits.dart';
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

  String get scanReceipt {
    return Intl.message(
      'Scan receipt',
      locale: localeName,
    );
  }

  String get addItem {
    return Intl.message(
      'Add item',
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

  String get dataWillBeDeleted {
    return Intl.message(
      'Your data will be deleted, this action is non-reversible.',
      locale: localeName,
    );
  }

  String get areYouSure {
    return Intl.message(
      'Are you sure?',
      locale: localeName,
    );
  }

  String get ok {
    return Intl.message(
      'OK',
      locale: localeName,
    );
  }

  String get want {
    return Intl.message(
      'Want',
      locale: localeName,
    );
  }

  String get need {
    return Intl.message(
      'Need',
      locale: localeName,
    );
  }

  String get investment {
    return Intl.message(
      'Investment',
      locale: localeName,
    );
  }

  String get transactionType {
    return Intl.message(
      'Transaction type',
      locale: localeName,
    );
  }

  String get deleteCategoryConfirmationMsg {
    return Intl.message(
      'All subcategories and transactions of this category will be deleted. This action is irreversible.',
      locale: localeName,
    );
  }

  String get setUpData {
    return Intl.message(
      'Set up data',
      locale: localeName,
    );
  }

  String get couldNotSetUpData {
    return Intl.message(
      'Could not set up data',
      locale: localeName,
    );
  }

  String get dataIsSetUp {
    return Intl.message(
      'Data is set up',
      locale: localeName,
    );
  }

  String get couldNotDeleteAccount {
    return Intl.message(
      'Could not delete account',
      locale: localeName,
    );
  }

  String get done {
    return Intl.message(
      'Done',
      locale: localeName,
    );
  }

  String get daily {
    return Intl.message(
      'Daily',
      locale: localeName,
    );
  }

  String get weekly {
    return Intl.message(
      'Weekly',
      locale: localeName,
    );
  }

  String get monthly {
    return Intl.message(
      'Monthly',
      locale: localeName,
    );
  }

  String get yearly {
    return Intl.message(
      'Yearly',
      locale: localeName,
    );
  }

  String get recurrenceInterval {
    return Intl.message(
      'Recurrence interval',
      locale: localeName,
    );
  }

  String get recurrence {
    return Intl.message(
      'Recurrence',
      locale: localeName,
    );
  }

  String get every {
    return Intl.message(
      'Every',
      locale: localeName,
    );
  }

  String get repeat {
    return Intl.message(
      'Repeat',
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

  String day(int howMany) {
    return Intl.plural(
      howMany,
      one: 'Day',
      other: 'Days',
      name: 'dayPlural',
      locale: localeName,
      args: [howMany],
    );
  }

  String weekDay(int howMany) {
    return Intl.plural(
      howMany,
      one: 'Weekday',
      other: 'Weekdays',
      name: 'weekDayPlural',
      locale: localeName,
      args: [howMany],
    );
  }

  String week(int howMany) {
    return Intl.plural(
      howMany,
      one: 'Week',
      other: 'Weeks',
      name: 'weekPlural',
      locale: localeName,
      args: [howMany],
    );
  }

  String month(int howMany) {
    return Intl.plural(
      howMany,
      one: 'Month',
      other: 'Months',
      name: 'monthPlural',
      locale: localeName,
      args: [howMany],
    );
  }

  String year(int howMany) {
    return Intl.plural(
      howMany,
      one: 'Year',
      other: 'Years',
      name: 'yearPlural',
      locale: localeName,
      args: [howMany],
    );
  }

  String get userCouldNotBeFound {
    return Intl.message(
      'User could not be found.',
      locale: localeName,
    );
  }

  String get retrievedUser {
    return Intl.message(
      'Successfully retrieved user.',
      locale: localeName,
    );
  }

  String get couldNotDeleteData {
    return Intl.message(
      'Could not delete your data.',
      locale: localeName,
    );
  }

  String get fetchedCategories {
    return Intl.message(
      'Fetched categories.',
      locale: localeName,
    );
  }

  String get subcategories {
    return Intl.message(
      'Subcategories',
      locale: localeName,
    );
  }

  String get title {
    return Intl.message(
      'Title',
      locale: localeName,
    );
  }

  String get settings {
    return Intl.message(
      'Settings',
      locale: localeName,
    );
  }

  String get reason {
    return Intl.message(
      'Reason',
      locale: localeName,
    );
  }

  String get none {
    return Intl.message(
      'None',
      locale: localeName,
    );
  }

  String get addSubcategory {
    return Intl.message(
      'Add subcategory',
      locale: localeName,
    );
  }

  String get updatedCategory {
    return Intl.message(
      'Updated category',
      locale: localeName,
    );
  }

  String get couldNotUpdateCategory {
    return Intl.message(
      'Could not update category',
      locale: localeName,
    );
  }

  String get createdCategory {
    return Intl.message(
      'Created category',
      locale: localeName,
    );
  }

  String get couldNotCreateCategory {
    return Intl.message(
      'Could not create category',
      locale: localeName,
    );
  }

  String get noData {
    return Intl.message(
      'No data',
      locale: localeName,
    );
  }

  String get error {
    return Intl.message(
      'Error',
      locale: localeName,
    );
  }

  String get history {
    return Intl.message(
      'History',
      locale: localeName,
    );
  }

  String get analytics {
    return Intl.message(
      'Analytics',
      locale: localeName,
    );
  }

  String get addExpense {
    return Intl.message(
      'Add expense',
      locale: localeName,
    );
  }

  String get addIncome {
    return Intl.message(
      'Add income',
      locale: localeName,
    );
  }

  String get createdTransaction {
    return Intl.message(
      'Created transaction',
      locale: localeName,
    );
  }

  String get updatedTransaction {
    return Intl.message(
      'Updated transaction',
      locale: localeName,
    );
  }

  String get couldNotCreateTransaction {
    return Intl.message(
      'Could not create transaction',
      locale: localeName,
    );
  }

  String get couldNotUpdateTransaction {
    return Intl.message(
      'Could not update transaction',
      locale: localeName,
    );
  }

  String get errorFetchingCategory {
    return Intl.message(
      'Error fetching category',
      locale: localeName,
    );
  }

  String get errorFetchingTransaction {
    return Intl.message(
      'Error fetching transaction',
      locale: localeName,
    );
  }

  String get couldNotLoadCategories {
    return Intl.message(
      'Could not load categories.',
      locale: localeName,
    );
  }

  String get pleaseTryAgainLater {
    return Intl.message(
      'Please try again later.',
      locale: localeName,
    );
  }

  String get noCategoryData {
    return Intl.message(
      'No category data',
      locale: localeName,
    );
  }

  String get dateIsNotInRightFormat {
    return Intl.message(
      'Date is not in right format',
      locale: localeName,
    );
  }

  String get dateFormatIsNotSpecified {
    return Intl.message(
      'Date format is not specified',
      locale: localeName,
    );
  }

  String get addCategory {
    return Intl.message(
      'Add category',
      locale: localeName,
    );
  }

  String get secondaryCategory {
    return Intl.message(
      'Secondary category',
      locale: localeName,
    );
  }

  String get tertiaryCategory {
    return Intl.message(
      'Tertiary category',
      locale: localeName,
    );
  }

  String get date {
    return Intl.message(
      'Date',
      locale: localeName,
    );
  }

  String get value {
    return Intl.message(
      'Value',
      locale: localeName,
    );
  }

  String get valueIsRequired {
    return Intl.message(
      'Value is required',
      locale: localeName,
    );
  }

  String get numberNotValid {
    return Intl.message(
      'Number not valid',
      locale: localeName,
    );
  }

  String get deletedTransaction {
    return Intl.message(
      'Deleted transaction',
      locale: localeName,
    );
  }

  String get addTransaction {
    return Intl.message(
      'Add transaction',
      locale: localeName,
    );
  }

  String get couldNotLoadCategoriesFilter {
    return Intl.message(
      'Could not load categories filter',
      locale: localeName,
    );
  }

  String get couldNotDeleteTransaction {
    return Intl.message(
      'Could not delete transaction',
      locale: localeName,
    );
  }

  String get all {
    return Intl.message(
      'All',
      locale: localeName,
    );
  }

  String get dateRange {
    return Intl.message(
      'Date range',
      locale: localeName,
    );
  }

  String get reasons {
    return Intl.message(
      'Reasons',
      locale: localeName,
    );
  }

  String get scan {
    return Intl.message(
      'Scan',
      locale: localeName,
    );
  }

  String get transaction {
    return Intl.message(
      'Transaction',
      locale: localeName,
    );
  }

  String get receipt {
    return Intl.message(
      'Receipt',
      locale: localeName,
    );
  }

  String get newReceipt {
    return Intl.message(
      'New receipt',
      locale: localeName,
    );
  }

  String get createdTransactions {
    return Intl.message(
      'Created transactions',
      locale: localeName,
    );
  }

  String get couldNotCreateTransactions {
    return Intl.message(
      'Could not create transactions',
      locale: localeName,
    );
  }

  String get camera {
    return Intl.message(
      'Camera',
      locale: localeName,
    );
  }

  String get gallery {
    return Intl.message(
      'Gallery',
      locale: localeName,
    );
  }

  String get failedToProcessReceipt {
    return Intl.message(
      'Failed to process receipt',
      locale: localeName,
    );
  }

  String get receiptProcessingQuotaHasBeenReached {
    return Intl.message(
      'Receipt processing quota has been reached for this month',
      locale: localeName,
    );
  }

  String get processingReceipts {
    return Intl.message(
      'Processing receipts',
      locale: localeName,
    );
  }

  String get totalPrice {
    return Intl.message(
      'Total price',
      locale: localeName,
    );
  }

  String get addReceiptTransactions {
    return Intl.message(
      'Add receipt transactions',
      locale: localeName,
    );
  }

  String get overview {
    return Intl.message(
      'Overview',
      locale: localeName,
    );
  }

  String get incomeByCategory {
    return Intl.message(
      'Income by category',
      locale: localeName,
    );
  }

  String get moreDetails {
    return Intl.message(
      'More details',
      locale: localeName,
    );
  }

  String get loading {
    return Intl.message(
      'Loading',
      locale: localeName,
    );
  }

  String get settingUpData {
    return Intl.message(
      'Setting up data',
      locale: localeName,
    );
  }

  String get welcome {
    return Intl.message(
      'Welcome',
      locale: localeName,
    );
  }

  String get spendingByCategory {
    return Intl.message(
      'Spending by category',
      locale: localeName,
    );
  }

  String get total {
    return Intl.message(
      'Total',
      locale: localeName,
    );
  }

  String get failurePickingImages {
    return Intl.message(
      'Failure picking images',
      locale: localeName,
    );
  }

  String get failureCapturingImage {
    return Intl.message(
      'Failure capturing image',
      locale: localeName,
    );
  }

  String get dataExtracted {
    return Intl.message(
      'Data extracted',
      locale: localeName,
    );
  }

  String get uploadedFiles {
    return Intl.message(
      'Uploaded files',
      locale: localeName,
    );
  }

  String get spendingByReason {
    return Intl.message(
      'Spending by reason',
      locale: localeName,
    );
  }

  String get unspecified {
    return Intl.message(
      'Unspecified',
      locale: localeName,
    );
  }

  String get january {
    return Intl.message(
      'January',
      locale: localeName,
    );
  }

  String get february {
    return Intl.message(
      'February',
      locale: localeName,
    );
  }

  String get march {
    return Intl.message(
      'March',
      locale: localeName,
    );
  }

  String get april {
    return Intl.message(
      'April',
      locale: localeName,
    );
  }

  String get may {
    return Intl.message(
      'May',
      locale: localeName,
    );
  }

  String get june {
    return Intl.message(
      'June',
      locale: localeName,
    );
  }

  String get july {
    return Intl.message(
      'July',
      locale: localeName,
    );
  }

  String get august {
    return Intl.message(
      'August',
      locale: localeName,
    );
  }

  String get september {
    return Intl.message(
      'September',
      locale: localeName,
    );
  }

  String get october {
    return Intl.message(
      'October',
      locale: localeName,
    );
  }

  String get november {
    return Intl.message(
      'November',
      locale: localeName,
    );
  }

  String get december {
    return Intl.message(
      'December',
      locale: localeName,
    );
  }

  String get repeatsEveryDay {
    return Intl.message(
      'Repeats every day',
      locale: localeName,
    );
  }

  String get fetchedReceiptRecognitionQuota {
    return Intl.message(
      'Fetched receipt recognition quota',
      locale: localeName,
    );
  }

  String get failureFetchingReceiptRecognitionQuota {
    return Intl.message(
      'Failure fetching receipt recognition quota',
      locale: localeName,
    );
  }

  String get updatedNotificationPreferences {
    return Intl.message(
      'Updated notification preferences',
      locale: localeName,
    );
  }

  String get recurringTransactionsNotifications {
    return Intl.message(
      'Recurring transactions notifications',
      locale: localeName,
    );
  }

  String get remindsAboutUpcomingScheduledPayments {
    return Intl.message(
      'Reminds about upcoming scheduled payments',
      locale: localeName,
    );
  }

  String get oneTime {
    return Intl.message(
      'One time',
      locale: localeName,
    );
  }

  String get addBudget {
    return Intl.message(
      'Add budget',
      locale: localeName,
    );
  }

  String get createdBudget {
    return Intl.message(
      'Created budget',
      locale: localeName,
    );
  }

  String get couldNotCreateBudget {
    return Intl.message(
      'Could not create budget',
      locale: localeName,
    );
  }

  String get startDate {
    return Intl.message(
      'Start date',
      locale: localeName,
    );
  }

  String get endDate {
    return Intl.message(
      'End date',
      locale: localeName,
    );
  }

  String get updatedBudget {
    return Intl.message(
      'Updated budget',
      locale: localeName,
    );
  }

  String get couldNotUpdateBudget {
    return Intl.message(
      'Could not update budget',
      locale: localeName,
    );
  }

  String get deletedBudget {
    return Intl.message(
      'Deleted budget',
      locale: localeName,
    );
  }

  String get requestFailed {
    return Intl.message(
      'Request failed',
      locale: localeName,
    );
  }

  String get successfulyEmbeddedInput {
    return Intl.message(
      'Successfuly embedded input',
      locale: localeName,
    );
  }

  String get detectCategories {
    return Intl.message(
      'Detect categories',
      locale: localeName,
    );
  }

  String get details {
    return Intl.message(
      'Details',
      locale: localeName,
    );
  }

  String get shopName {
    return Intl.message(
      'Shop name',
      locale: localeName,
    );
  }

  String get categoryDetectionTooltip {
    return Intl.message(
      'Filling out this field helps category detection percision',
      locale: localeName,
    );
  }

  String get detectedCategoriesForProducts {
    return Intl.message(
      'Detected categories for products',
      locale: localeName,
    );
  }

  String get categoryDetectionTips {
    return Intl.message(
      'Titles of all products must be filled out for category detection to work',
      locale: localeName,
    );
  }

  String get categorizationRequestTimedOut {
    return Intl.message(
      'Categorization request timed out',
      locale: localeName,
    );
  }

  String get noProductItems {
    return Intl.message(
      'No product items',
      locale: localeName,
    );
  }

  String get addAFewItemsAndTryAgain {
    return Intl.message(
      'Add a few items and try again',
      locale: localeName,
    );
  }

  String get noCategories {
    return Intl.message(
      'No categories',
      locale: localeName,
    );
  }

  String get addAFewCategoriesAndTryAgain {
    return Intl.message(
      'Add a few categories and try again',
      locale: localeName,
    );
  }

  String get detectingCategories {
    return Intl.message(
      'Detecting categories',
      locale: localeName,
    );
  }

  String get pdfFiles {
    return Intl.message(
      'PDF files',
      locale: localeName,
    );
  }

  String get fileIsNotSavedOnDisk {
    return Intl.message(
      'File is not saved on disk',
      locale: localeName,
    );
  }

  String get creatingAccount {
    return Intl.message(
      'Creating account',
      locale: localeName,
    );
  }

  String categorizedXProducts(int howMany, int all) {
    return Intl.message(
      'Categorized $howMany out of $all products because the request was too big. To categorize the remaining products enable categorization of products that don\'t have category selected press the button again.',
      locale: localeName,
      name: 'deleteBudgetConfirmationsMsg',
      args: [
        howMany,
        all,
      ],
    );
  }

  String deleteBudgetConfirmationMsg(String budgetTitle) {
    return Intl.message(
      'Are you sure you want to delete budget $budgetTitle',
      locale: localeName,
      name: 'deleteBudgetConfirmationsMsg',
      args: [
        budgetTitle,
      ],
    );
  }

  String couldNotFetchDataForBudget(String budgetTitle) {
    return Intl.message(
      'Could not fetch data for budget $budgetTitle',
      locale: localeName,
      name: 'couldNotFetchDataForBudget',
      args: [
        budgetTitle,
      ],
    );
  }

  String couldNotDeleteBudgetWithTitle(String budgetTitle) {
    return Intl.message(
      'Could not delete budget $budgetTitle',
      locale: localeName,
      name: 'couldNotDeleteBudgetWithTitle',
      args: [
        budgetTitle,
      ],
    );
  }

  String deletedBudgetWithTitle(String budgetTitle) {
    return Intl.message(
      'Deleted budget $budgetTitle',
      locale: localeName,
      name: 'deletedBudgetWithTitle',
      args: [
        budgetTitle,
      ],
    );
  }

  String spentXPercentageOdIncome(double percentage) {
    return Intl.message(
      'You spent ${percentage.toStringAsFixed(priceFractionDigits)}% of your income in the selected period',
      locale: localeName,
      name: 'spentXPercentageOdIncome',
      args: [
        percentage,
      ],
    );
  }

  String createdXOutOfYTransactions(
    int numberOfCreatedTransactions,
    int numberOfAllTransactions,
  ) {
    return Intl.message(
      'Created $numberOfCreatedTransactions/$numberOfAllTransactions transactions',
      locale: localeName,
      name: 'createdXOutOfYTransactions',
      args: [
        numberOfCreatedTransactions,
        numberOfAllTransactions,
      ],
    );
  }

  String couldNotDeleteCategory(String categoryTitle) {
    return Intl.message(
      'Could not delete category $categoryTitle',
      locale: localeName,
      name: 'couldNotDeleteCategory',
      args: [categoryTitle],
    );
  }

  String deletedCategory(String categoryTitle) {
    return Intl.message(
      'Deleted category $categoryTitle',
      locale: localeName,
      name: 'deletedCategory',
      args: [categoryTitle],
    );
  }

  String couldNotDeleteTransactionWithTitle(String title) {
    return Intl.message(
      'Could not delete transaction $title',
      locale: localeName,
      name: 'couldNotDeleteTransactionWithTitle',
      args: [title],
    );
  }

  String deletedTransactionWithTitle(String title) {
    return Intl.message(
      'Deleted transaction $title',
      locale: localeName,
      name: 'deletedTransactionWithTitle',
      args: [title],
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

  String intNumberIsNotWithinRange(int min, int max) {
    return Intl.message(
      'Number is not within range $min - $max',
      locale: localeName,
      name: 'intNumberIsNotWithinRange',
      args: [min, max],
    );
  }

  String repeatsEveryWeekOn(String weekDays) {
    return Intl.message(
      'Repeats every week on $weekDays',
      locale: localeName,
      name: 'repeatsEveryWeekOn',
      args: [weekDays],
    );
  }

  String repeatsEveryMonthOnDay(int day) {
    return Intl.message(
      'Repeats every month on day $day',
      locale: localeName,
      name: 'repeatsEveryMonthOnDay',
      args: [day],
    );
  }

  String repeatsEveryYearOnDayOfMonth(
    int day,
    int monthNumber,
    String monthName,
  ) {
    return Intl.message(
      'Repeats every year on day $day of month $monthNumber ($monthName)',
      locale: localeName,
      name: 'repeatsEveryYearOnDayOfMonth',
      args: [day, monthNumber, monthName],
    );
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
