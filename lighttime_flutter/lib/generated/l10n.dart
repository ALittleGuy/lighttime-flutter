// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: 'Title for left drawer login text',
      args: [],
    );
  }

  /// `reigister`
  String get register {
    return Intl.message(
      'reigister',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get noAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUpRightNow {
    return Intl.message(
      'Sign up',
      name: 'signUpRightNow',
      desc: '',
      args: [],
    );
  }

  /// `Light Time`
  String get title {
    return Intl.message(
      'Light Time',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Signin`
  String get signIn {
    return Intl.message(
      'Signin',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Guest`
  String get guest {
    return Intl.message(
      'Guest',
      name: 'guest',
      desc: '',
      args: [],
    );
  }

  /// `Your Username`
  String get YourUsername {
    return Intl.message(
      'Your Username',
      name: 'YourUsername',
      desc: '',
      args: [],
    );
  }

  /// `Please make sure your username is 4-16 in length and contains only letters, underscores and numbers`
  String get UsernameWrong {
    return Intl.message(
      'Please make sure your username is 4-16 in length and contains only letters, underscores and numbers',
      name: 'UsernameWrong',
      desc: '',
      args: [],
    );
  }

  /// `Password Confirm`
  String get PasswordConfirm {
    return Intl.message(
      'Password Confirm',
      name: 'PasswordConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Your Password`
  String get YouPassword {
    return Intl.message(
      'Your Password',
      name: 'YouPassword',
      desc: '',
      args: [],
    );
  }

  /// `Your Email`
  String get YourEmail {
    return Intl.message(
      'Your Email',
      name: 'YourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get EmailWrong {
    return Intl.message(
      'Please enter a valid email',
      name: 'EmailWrong',
      desc: '',
      args: [],
    );
  }

  /// `Email can not be empty`
  String get EmailIsNull {
    return Intl.message(
      'Email can not be empty',
      name: 'EmailIsNull',
      desc: '',
      args: [],
    );
  }

  /// `UserName can not be empty`
  String get UserNameIsNull {
    return Intl.message(
      'UserName can not be empty',
      name: 'UserNameIsNull',
      desc: '',
      args: [],
    );
  }

  /// `Password is empty`
  String get PasswordIsNull {
    return Intl.message(
      'Password is empty',
      name: 'PasswordIsNull',
      desc: '',
      args: [],
    );
  }

  /// `Password is different`
  String get PasswordIsDifferent {
    return Intl.message(
      'Password is different',
      name: 'PasswordIsDifferent',
      desc: '',
      args: [],
    );
  }

  /// `The length of password at least to be 6`
  String get PassWordLength {
    return Intl.message(
      'The length of password at least to be 6',
      name: 'PassWordLength',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Email`
  String get invalidEmail {
    return Intl.message(
      'Invalid Email',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Username`
  String get invalidUsername {
    return Intl.message(
      'Invalid Username',
      name: 'invalidUsername',
      desc: '',
      args: [],
    );
  }

  /// `Already have a account?`
  String get havaAccount {
    return Intl.message(
      'Already have a account?',
      name: 'havaAccount',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get enterEmail {
    return Intl.message(
      'Please enter your email',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get enterPassword {
    return Intl.message(
      'Please enter your password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Task title is null`
  String get TaskTitleIsNull {
    return Intl.message(
      'Task title is null',
      name: 'TaskTitleIsNull',
      desc: '',
      args: [],
    );
  }

  /// `Start date of task is null`
  String get TaskStartDateIsNull {
    return Intl.message(
      'Start date of task is null',
      name: 'TaskStartDateIsNull',
      desc: '',
      args: [],
    );
  }

  /// `Deadline of task is null`
  String get TaskDeadLineIsNull {
    return Intl.message(
      'Deadline of task is null',
      name: 'TaskDeadLineIsNull',
      desc: '',
      args: [],
    );
  }

  /// `TaskTitle`
  String get TaskTitle {
    return Intl.message(
      'TaskTitle',
      name: 'TaskTitle',
      desc: '',
      args: [],
    );
  }

  /// `Select Start Date`
  String get SelectStartTime {
    return Intl.message(
      'Select Start Date',
      name: 'SelectStartTime',
      desc: '',
      args: [],
    );
  }

  /// `Select Deadline`
  String get SelectEndTime {
    return Intl.message(
      'Select Deadline',
      name: 'SelectEndTime',
      desc: '',
      args: [],
    );
  }

  /// `Start Date`
  String get StartDate {
    return Intl.message(
      'Start Date',
      name: 'StartDate',
      desc: '',
      args: [],
    );
  }

  /// `Deadline`
  String get Deadline {
    return Intl.message(
      'Deadline',
      name: 'Deadline',
      desc: '',
      args: [],
    );
  }

  /// `Task Content`
  String get TaskContent {
    return Intl.message(
      'Task Content',
      name: 'TaskContent',
      desc: '',
      args: [],
    );
  }

  /// `Sponsor Email`
  String get SponsorEmail {
    return Intl.message(
      'Sponsor Email',
      name: 'SponsorEmail',
      desc: '',
      args: [],
    );
  }

  /// `Comfirm`
  String get Confirm {
    return Intl.message(
      'Comfirm',
      name: 'Confirm',
      desc: '',
      args: [],
    );
  }

  /// `Task content is null. Are you insist to send?`
  String get TaskContentIsNull {
    return Intl.message(
      'Task content is null. Are you insist to send?',
      name: 'TaskContentIsNull',
      desc: '',
      args: [],
    );
  }

  /// `Task sponsor email is null`
  String get SponsorEmailIsNull {
    return Intl.message(
      'Task sponsor email is null',
      name: 'SponsorEmailIsNull',
      desc: '',
      args: [],
    );
  }

  /// `Login please`
  String get LoginFirst {
    return Intl.message(
      'Login please',
      name: 'LoginFirst',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get Login {
    return Intl.message(
      'Login',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `Task publish success`
  String get TaskSendSuccess {
    return Intl.message(
      'Task publish success',
      name: 'TaskSendSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Task publish fail, check the network may help`
  String get TaskSendFail {
    return Intl.message(
      'Task publish fail, check the network may help',
      name: 'TaskSendFail',
      desc: '',
      args: [],
    );
  }

  /// `Principal email`
  String get PrincipalEmail {
    return Intl.message(
      'Principal email',
      name: 'PrincipalEmail',
      desc: '',
      args: [],
    );
  }

  /// `Delete Task`
  String get DeleteTask {
    return Intl.message(
      'Delete Task',
      name: 'DeleteTask',
      desc: '',
      args: [],
    );
  }

  /// `Finish Task`
  String get FinishTask {
    return Intl.message(
      'Finish Task',
      name: 'FinishTask',
      desc: '',
      args: [],
    );
  }

  /// `Are you finished this task?`
  String get FinishTaskConfirmInfo {
    return Intl.message(
      'Are you finished this task?',
      name: 'FinishTaskConfirmInfo',
      desc: '',
      args: [],
    );
  }

  /// `Are you confirm to Delete this task?`
  String get DeleteTaskConfirmInfo {
    return Intl.message(
      'Are you confirm to Delete this task?',
      name: 'DeleteTaskConfirmInfo',
      desc: '',
      args: [],
    );
  }

  /// `No Remote Tasks`
  String get NoRemoteTasks {
    return Intl.message(
      'No Remote Tasks',
      name: 'NoRemoteTasks',
      desc: '',
      args: [],
    );
  }

  /// `No Completed Tasks`
  String get NoCompletedTasks {
    return Intl.message(
      'No Completed Tasks',
      name: 'NoCompletedTasks',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Auto`
  String get LanguageAuto {
    return Intl.message(
      'Auto',
      name: 'LanguageAuto',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get Theme {
    return Intl.message(
      'Theme',
      name: 'Theme',
      desc: '',
      args: [],
    );
  }

  /// `Theme Settings`
  String get ThemeSettings {
    return Intl.message(
      'Theme Settings',
      name: 'ThemeSettings',
      desc: '',
      args: [],
    );
  }

  /// `Personal Info`
  String get PersonalInfo {
    return Intl.message(
      'Personal Info',
      name: 'PersonalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Language settigns`
  String get LanguageSettings {
    return Intl.message(
      'Language settigns',
      name: 'LanguageSettings',
      desc: '',
      args: [],
    );
  }

  /// `Task Release`
  String get TaskRelease {
    return Intl.message(
      'Task Release',
      name: 'TaskRelease',
      desc: '',
      args: [],
    );
  }

  /// `Remote Tasks`
  String get RemoteTasks {
    return Intl.message(
      'Remote Tasks',
      name: 'RemoteTasks',
      desc: '',
      args: [],
    );
  }

  /// `Local Tasks`
  String get LocalTasks {
    return Intl.message(
      'Local Tasks',
      name: 'LocalTasks',
      desc: '',
      args: [],
    );
  }

  /// `Todo`
  String get Todo {
    return Intl.message(
      'Todo',
      name: 'Todo',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get Completed {
    return Intl.message(
      'Completed',
      name: 'Completed',
      desc: '',
      args: [],
    );
  }

  /// `No Todo Tasks`
  String get NoToedoTasks {
    return Intl.message(
      'No Todo Tasks',
      name: 'NoToedoTasks',
      desc: '',
      args: [],
    );
  }

  /// `Local`
  String get Local {
    return Intl.message(
      'Local',
      name: 'Local',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get UserName {
    return Intl.message(
      'User Name',
      name: 'UserName',
      desc: '',
      args: [],
    );
  }

  /// `offline`
  String get Offline {
    return Intl.message(
      'offline',
      name: 'Offline',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get Logout {
    return Intl.message(
      'Logout',
      name: 'Logout',
      desc: '',
      args: [],
    );
  }

  /// `Signup`
  String get Signup {
    return Intl.message(
      'Signup',
      name: 'Signup',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'zn', countryCode: 'CN'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}