
import 'package:flutter/material.dart';
import 'package:lighttime_flutter/models/index.dart';
import 'package:lighttime_flutter/redux/locale_redux.dart';
import 'package:lighttime_flutter/redux/theme_redux.dart';
import 'package:lighttime_flutter/redux/user_redux.dart';

class LightTimeState{

  User user;

  Theme theme;

  Locale locale;

  Locale systemLocale;

  LightTimeState({this.user , this.theme  , this.locale , this.systemLocale, this.login});

  bool login;
}


LightTimeState appReducer ( LightTimeState lightTimeState , action ){

  return new LightTimeState(
    user: UserReducer(lightTimeState.user ,action),
    theme: ThemeReducer(lightTimeState.theme , action),
    locale: LocaleReducer(lightTimeState.locale , action),
    systemLocale: lightTimeState.systemLocale,
    login: lightTimeState.login,
  );

}