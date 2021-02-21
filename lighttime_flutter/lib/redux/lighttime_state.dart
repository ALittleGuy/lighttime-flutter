import 'package:flutter/material.dart';
import 'package:lighttime_flutter/common/models/user.dart';
import 'package:lighttime_flutter/redux/locale_redux.dart';
import 'package:lighttime_flutter/redux/theme_redux.dart';
import 'package:lighttime_flutter/redux/token_redux.dart';
import 'package:lighttime_flutter/redux/user_redux.dart';

class LightTimeState {
  User user;

  ThemeData themeData;

  Locale locale;

  Locale systemLocale;

  LightTimeState(
      {this.user, this.themeData, this.locale, this.systemLocale, this.login , this.token});

  bool login;

  String token;
}

LightTimeState appReducer(LightTimeState lightTimeState, action) {
  return new LightTimeState(
    user: UserReducer(lightTimeState.user, action),
    themeData: ThemeReducer(lightTimeState.themeData, action),
    locale: LocaleReducer(lightTimeState.locale, action),
    systemLocale: lightTimeState.systemLocale,
    login: lightTimeState.login,
    token: TokenReducer(lightTimeState.token , action)
  );
}
