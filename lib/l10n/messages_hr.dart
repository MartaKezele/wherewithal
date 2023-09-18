// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a hr locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = MessageLookup();

typedef String? MessageIfAbsent(
    String? messageStr, List<Object>? args);

class MessageLookup extends MessageLookupByLibrary {
  @override
  String get localeName => 'hr';

  static m0(howMany) => "Minimum ${howMany} characters";

  static m1(day) => "on day ${day}";

  static m2(min) => "The password must contain at least ${min} characters";

  static m3(howMany) => Intl.plural(howMany, zero: 'Doesn\'t repeat', one: 'Repeats every day', other: 'Repeats every ${howMany} days');

  static m4(howMany) => Intl.plural(howMany, zero: 'Doesn\'t repeat', one: 'Repeats every month', other: 'Repeats every ${howMany} months');

  static m5(howMany) => Intl.plural(howMany, zero: 'Doesn\'t repeat', one: 'Repeats every week', other: 'Repeats every ${howMany} weeks');

  static m6(howMany) => Intl.plural(howMany, zero: 'Doesn\'t repeat', one: 'Repeats every year', other: 'Repeats every ${howMany} years');

  static m7(methods) => "Sign in using one of the following methods: ${methods}. Once signed in you can configure sign in with google account in the profile section.";

  static m8(minCharacters) => "The password must contain at least ${minCharacters} characters";

  @override
  final Map<String, dynamic> messages = _notInlinedMessages(_notInlinedMessages);

  static Map<String, dynamic> _notInlinedMessages(_) => {
      'A network error has occured. Please check your internet connection and try again.': MessageLookupByLibrary.simpleMessage('A network error has occured. Please check your internet connection and try again.'),
    'A verification email has been sent': MessageLookupByLibrary.simpleMessage('A verification email has been sent'),
    'A verification email has been sent to your email address, follow the instructions in the email to verify account.': MessageLookupByLibrary.simpleMessage('A verification email has been sent to your email address, follow the instructions in the email to verify account.'),
    'Account associated with the given email has been disabled': MessageLookupByLibrary.simpleMessage('Account associated with the given email has been disabled'),
    'Account could not be found': MessageLookupByLibrary.simpleMessage('Account could not be found'),
    'Account with the given email isn\'t configured to sign in with google': MessageLookupByLibrary.simpleMessage('Account with the given email isn\'t configured to sign in with google'),
    'Add': MessageLookupByLibrary.simpleMessage('Add'),
    'Already have an account?': MessageLookupByLibrary.simpleMessage('Already have an account?'),
    'An account with the given email address already exists': MessageLookupByLibrary.simpleMessage('An account with the given email address already exists'),
    'Budget': MessageLookupByLibrary.simpleMessage('Proračun'),
    'Cancel': MessageLookupByLibrary.simpleMessage('Cancel'),
    'Categories': MessageLookupByLibrary.simpleMessage('Kategorije'),
    'Category': MessageLookupByLibrary.simpleMessage('Category'),
    'Change password': MessageLookupByLibrary.simpleMessage('Change password'),
    'Changed password': MessageLookupByLibrary.simpleMessage('Changed password'),
    'Click on the link in the email to verify your email address': MessageLookupByLibrary.simpleMessage('Click on the link in the email to verify your email address'),
    'Close': MessageLookupByLibrary.simpleMessage('Close'),
    'Configure': MessageLookupByLibrary.simpleMessage('Configure'),
    'Configure password': MessageLookupByLibrary.simpleMessage('Configure password'),
    'Confirm': MessageLookupByLibrary.simpleMessage('Confirm'),
    'Continue': MessageLookupByLibrary.simpleMessage('Continue'),
    'Continue with google': MessageLookupByLibrary.simpleMessage('Continue with google'),
    'Could not send verification email because email is already verified': MessageLookupByLibrary.simpleMessage('Could not send verification email because email is already verified'),
    'Create account': MessageLookupByLibrary.simpleMessage('Create account'),
    'Currency': MessageLookupByLibrary.simpleMessage('Currency'),
    'Dark': MessageLookupByLibrary.simpleMessage('Dark'),
    'Date format': MessageLookupByLibrary.simpleMessage('Date format'),
    'Delete': MessageLookupByLibrary.simpleMessage('Delete'),
    'Delete account': MessageLookupByLibrary.simpleMessage('Delete account'),
    'Deleted account': MessageLookupByLibrary.simpleMessage('Deleted account'),
    'Didn\'t receive the email? Check your spam folder.': MessageLookupByLibrary.simpleMessage('Didn\'t receive the email? Check your spam folder.'),
    'Don\'t have an account?': MessageLookupByLibrary.simpleMessage('Don\'t have an account?'),
    'Don\'t see the email? Check your spam folder': MessageLookupByLibrary.simpleMessage('Don\'t see the email? Check your spam folder'),
    'Email': MessageLookupByLibrary.simpleMessage('Email'),
    'Email address is not valid': MessageLookupByLibrary.simpleMessage('Email address is not valid'),
    'Email format is incorrect': MessageLookupByLibrary.simpleMessage('Email format is incorrect'),
    'Email is required': MessageLookupByLibrary.simpleMessage('Email is required'),
    'Email not verified': MessageLookupByLibrary.simpleMessage('Email not verified'),
    'Email verified': MessageLookupByLibrary.simpleMessage('Email verified'),
    'Error fetching data': MessageLookupByLibrary.simpleMessage('Error fetching data'),
    'Expense': MessageLookupByLibrary.simpleMessage('Expense'),
    'Flag image': MessageLookupByLibrary.simpleMessage('Flag image'),
    'Follow the instructions in the verification email or click on the resend button': MessageLookupByLibrary.simpleMessage('Follow the instructions in the verification email or click on the resend button'),
    'Forgot password': MessageLookupByLibrary.simpleMessage('Forgot password'),
    'Friday': MessageLookupByLibrary.simpleMessage('Friday'),
    'Go back': MessageLookupByLibrary.simpleMessage('Go back'),
    'Google': MessageLookupByLibrary.simpleMessage('Google'),
    'Income': MessageLookupByLibrary.simpleMessage('Income'),
    'Insights': MessageLookupByLibrary.simpleMessage('Uvidi'),
    'Language': MessageLookupByLibrary.simpleMessage('Jezik'),
    'Light': MessageLookupByLibrary.simpleMessage('Light'),
    'Link google account': MessageLookupByLibrary.simpleMessage('Link google account'),
    'Monday': MessageLookupByLibrary.simpleMessage('Monday'),
    'Name': MessageLookupByLibrary.simpleMessage('Name'),
    'Notifications': MessageLookupByLibrary.simpleMessage('Notifications'),
    'Password': MessageLookupByLibrary.simpleMessage('Password'),
    'Password is required': MessageLookupByLibrary.simpleMessage('Password is required'),
    'Password reset email was sent, check your inbox.': MessageLookupByLibrary.simpleMessage('Password reset email was sent, check your inbox.'),
    'Personal finance tracker': MessageLookupByLibrary.simpleMessage('Personal finance tracker'),
    'Please try again later': MessageLookupByLibrary.simpleMessage('Please try again later'),
    'Proccess aborted': MessageLookupByLibrary.simpleMessage('Proccess aborted'),
    'Profile': MessageLookupByLibrary.simpleMessage('Profile'),
    'Provide your email address and we will send you an email with instructions to reset your password': MessageLookupByLibrary.simpleMessage('Provide your email address and we will send you an email with instructions to reset your password'),
    'Reauthenticate with google account': MessageLookupByLibrary.simpleMessage('Reauthenticate with google account'),
    'Reauthenticate with password': MessageLookupByLibrary.simpleMessage('Reauthenticate with password'),
    'Reauthenticating with google account': MessageLookupByLibrary.simpleMessage('Reauthenticating with google account'),
    'Recurring transactions': MessageLookupByLibrary.simpleMessage('Ponavljajuće transakcije'),
    'Resend verification email': MessageLookupByLibrary.simpleMessage('Resend verification email'),
    'Retry': MessageLookupByLibrary.simpleMessage('Retry'),
    'Saturday': MessageLookupByLibrary.simpleMessage('Saturday'),
    'Save': MessageLookupByLibrary.simpleMessage('Save'),
    'Send': MessageLookupByLibrary.simpleMessage('Send'),
    'Sign in': MessageLookupByLibrary.simpleMessage('Sign in'),
    'Sign in methods': MessageLookupByLibrary.simpleMessage('Sign in methods'),
    'Sign in process was aborted': MessageLookupByLibrary.simpleMessage('Sign in process was aborted'),
    'Sign out': MessageLookupByLibrary.simpleMessage('Sign out'),
    'Something unexpected happened. Please try again later.': MessageLookupByLibrary.simpleMessage('Something unexpected happened. Please try again later.'),
    'Successfully linked account with credentials': MessageLookupByLibrary.simpleMessage('Successfully linked account with credentials'),
    'Successfully reauthenticated': MessageLookupByLibrary.simpleMessage('Successfully reauthenticated'),
    'Successfully reloaded user': MessageLookupByLibrary.simpleMessage('Successfully reloaded user'),
    'Successfully signed in': MessageLookupByLibrary.simpleMessage('Successfully signed in'),
    'Successfully signed out': MessageLookupByLibrary.simpleMessage('Successfully signed out'),
    'Successfuly created account': MessageLookupByLibrary.simpleMessage('Successfuly created account'),
    'Successfuly fetched sign in methods': MessageLookupByLibrary.simpleMessage('Successfuly fetched sign in methods'),
    'Sunday': MessageLookupByLibrary.simpleMessage('Sunday'),
    'System': MessageLookupByLibrary.simpleMessage('System'),
    'The account associated with the credential already exists, or is already linked to a user.': MessageLookupByLibrary.simpleMessage('The account associated with the credential already exists, or is already linked to a user.'),
    'The authentication provider is already linked to the account': MessageLookupByLibrary.simpleMessage('The authentication provider is already linked to the account'),
    'The credential given does not correspond to the user': MessageLookupByLibrary.simpleMessage('The credential given does not correspond to the user'),
    'The credential is malformed or has expired': MessageLookupByLibrary.simpleMessage('The credential is malformed or has expired'),
    'The password is invalid': MessageLookupByLibrary.simpleMessage('The password is invalid'),
    'Theme mode': MessageLookupByLibrary.simpleMessage('Theme mode'),
    'There are no configured auth providers for account': MessageLookupByLibrary.simpleMessage('There are no configured auth providers for account'),
    'There is no account associated with the given email': MessageLookupByLibrary.simpleMessage('There is no account associated with the given email'),
    'Thursday': MessageLookupByLibrary.simpleMessage('Thursday'),
    'Track your expenses, gain insights and plan for the future to take charge of your finances': MessageLookupByLibrary.simpleMessage('Track your expenses, gain insights and plan for the future to take charge of your finances'),
    'Tuesday': MessageLookupByLibrary.simpleMessage('Tuesday'),
    'Updated your information': MessageLookupByLibrary.simpleMessage('Updated your information'),
    'Verification email could not be sent': MessageLookupByLibrary.simpleMessage('Verification email could not be sent'),
    'Verification email could not be sent because you\'re not signed in/your credentials are not valid.': MessageLookupByLibrary.simpleMessage('Verification email could not be sent because you\'re not signed in/your credentials are not valid.'),
    'Verify email': MessageLookupByLibrary.simpleMessage('Verify email'),
    'Version': MessageLookupByLibrary.simpleMessage('Version'),
    'We don\'t support this sign in method yet. Try using another sign in method.': MessageLookupByLibrary.simpleMessage('We don\'t support this sign in method yet. Try using another sign in method.'),
    'Wednesday': MessageLookupByLibrary.simpleMessage('Wednesday'),
    'Wherewithal': MessageLookupByLibrary.simpleMessage('Wherewithal'),
    'You must reauthenticate to continue': MessageLookupByLibrary.simpleMessage('You must reauthenticate to continue'),
    'You\'re not signed in': MessageLookupByLibrary.simpleMessage('You\'re not signed in'),
    'You\'ve made too many requests in a short amount of time': MessageLookupByLibrary.simpleMessage('You\'ve made too many requests in a short amount of time'),
    'days': MessageLookupByLibrary.simpleMessage('days'),
    'minCharacters': m0,
    'months': MessageLookupByLibrary.simpleMessage('months'),
    'on Friday': MessageLookupByLibrary.simpleMessage('on Friday'),
    'on Monday': MessageLookupByLibrary.simpleMessage('on Monday'),
    'on Saturday': MessageLookupByLibrary.simpleMessage('on Saturday'),
    'on Sunday': MessageLookupByLibrary.simpleMessage('on Sunday'),
    'on Thursday': MessageLookupByLibrary.simpleMessage('on Thursday'),
    'on Tuesday': MessageLookupByLibrary.simpleMessage('on Tuesday'),
    'on Wednesday': MessageLookupByLibrary.simpleMessage('on Wednesday'),
    'onDay': m1,
    'passwordCharactersRestrictionMsg': m2,
    'repeatsEveryXDays': m3,
    'repeatsEveryXMonths': m4,
    'repeatsEveryXWeeks': m5,
    'repeatsEveryXYears': m6,
    'signInUsingMethods': m7,
    'weakPasswordErrorMsg': m8,
    'weeks': MessageLookupByLibrary.simpleMessage('weeks'),
    'years': MessageLookupByLibrary.simpleMessage('years')
  };
}
