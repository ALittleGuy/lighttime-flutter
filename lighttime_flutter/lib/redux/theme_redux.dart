

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

final ThemeReducer = combineReducers<Theme>([
    TypedReducer<Theme , ThemeRefresh>(_refresh)
]);


Theme _refresh(Theme theme, action){

  theme = action.themeData;
  return theme;

}


class ThemeRefresh{

  Theme theme;

  ThemeRefresh(this.theme);
}