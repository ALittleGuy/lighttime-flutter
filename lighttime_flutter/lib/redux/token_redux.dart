import 'package:redux/redux.dart';


final  TokenReducer = combineReducers<String>([
  TypedReducer<String , TokenUpdateAction>(_updateToken),
]) ;


String _updateToken(String token , action){
  token = action.token;
  return token;
}

class TokenUpdateAction{
  String token;
  TokenUpdateAction(this.token);
}