
import 'dart:ui';

import 'package:redux/redux.dart';

final LocaleReducer = combineReducers<Locale>([
    TypedReducer<Locale  , LocaleRefresh >(_refresh)
] );

Locale _refresh(Locale locale , action){
  locale = action.locale;
  return locale;

}

class LocaleRefresh{
  final Locale locale;
  LocaleRefresh(this.locale);
}

