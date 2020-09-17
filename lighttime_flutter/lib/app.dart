import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lighttime_flutter/models/index.dart';
import 'package:lighttime_flutter/page/home.dart';
import 'package:lighttime_flutter/page/login.dart';
import 'package:lighttime_flutter/page/register.dart';
import 'package:lighttime_flutter/redux/lighttime_state.dart';
import 'package:redux/redux.dart';

import 'generated/l10n.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App>  with NavigatorObserver{



  final store = new Store(
    appReducer,
    initialState: new LightTimeState(user: User.empty() , login: false , locale: Locale('zh' , 'CN'))
  );

  @override
  Widget build(BuildContext context) {
    
    return new StoreProvider(
        store: store,
        child:new StoreBuilder<LightTimeState>(builder: (context, store) {
          return new MaterialApp(
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              S.delegate

            ],
            home: Home(),
            routes: {
              Login.sname:(context){
                return new Login();
              },
              Register.sname:(context){
                return new Register();
              }
            },
          );
          }
        )
    );
    
  }
}