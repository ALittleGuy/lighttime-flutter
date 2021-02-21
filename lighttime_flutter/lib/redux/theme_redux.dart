import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

final ThemeReducer = combineReducers<ThemeData>([
  TypedReducer<ThemeData, ThemeRefreshAction>(_refresh)
]);


ThemeData _refresh(ThemeData themeData, action) {
  themeData = action.themeData;
  return themeData;
}


class ThemeRefreshAction {

  ThemeData themeData;

  ThemeRefreshAction(this.themeData);
}