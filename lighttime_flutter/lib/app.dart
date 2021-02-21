// import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:lighttime_flutter/common/page/user_center.dart';
//
// import 'package:lighttime_flutter/redux/lighttime_state.dart';
// import 'package:redux/redux.dart';
//
// import 'common/models/user.dart';
// import 'common/page/home.dart';
// import 'common/page/login.dart';
// import 'common/page/register.dart';
// import 'generated/l10n.dart';
//
// class App extends StatefulWidget {
//   App({Key key}) : super(key: key);
//
//   @override
//   _AppState createState() => _AppState();
// }
//
// class _AppState extends State<App> with NavigatorObserver {
//   final store = new Store(appReducer,
//       initialState: new LightTimeState(
//           user: User.empty(), login: false, locale: Locale('zh', 'CN')));
//
//   @override
//   Widget build(BuildContext context) {
//     return new StoreProvider(
//         store: store,
//         child: new StoreBuilder<LightTimeState>(builder: (context, store) {
//           return new MaterialApp(
//             localizationsDelegates: [
//               GlobalMaterialLocalizations.delegate,
//               GlobalWidgetsLocalizations.delegate,
//               S.delegate
//             ],
//             theme: store.state.themeData,
//             home: Home(),
//             routes: {
//               Login.sname: (context) {
//                 return new Login();
//               },
//               Register.sname: (context) {
//                 return new Register();
//               },
//               Home.sname: (context) {
//                 return new Home();
//               },
//               UserCenter.sname: (context) {
//                 return new UserCenter();
//               }
//             },
//           );
//         }));
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lighttime_flutter/channel/websocketUtil.dart';
import 'package:lighttime_flutter/common/database/databaseServer.dart';
import 'package:lighttime_flutter/common/page/languageRoute.dart';
import 'package:lighttime_flutter/common/page/localTask.dart';
import 'package:lighttime_flutter/common/page/new_local_task.dart';
import 'package:lighttime_flutter/common/page/new_task.dart';
import 'package:lighttime_flutter/common/page/remote_task.dart';
import 'package:lighttime_flutter/common/page/themeChangeRoute.dart';
import 'package:lighttime_flutter/states/notifier.dart';
import 'package:provider/provider.dart';

import 'common/page/home.dart';
import 'common/page/login.dart';
import 'common/page/register.dart';
import 'common/page/user_center.dart';
import 'generated/l10n.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TaskChannelInit();
    DatabaseServer.getInstance().init();
    // TODO: implement build
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ThemeModel()),
        ChangeNotifierProvider.value(value: UserModel()),
        ChangeNotifierProvider.value(value: LocaleModel()),
        ChangeNotifierProvider.value(value: TokenModel()),
        ChangeNotifierProvider.value(value: ProfileChangeNotifier()),
      ],
      child: Consumer2<ThemeModel, LocaleModel>(
        builder: (BuildContext context, themeModel, localeModel, Widget child) {
          return MaterialApp(
            theme: ThemeData(primarySwatch: themeModel.theme),
            home: Login(),
            onGenerateTitle: (context) => S.of(context).title,
            locale: localeModel.getLocale(),
            supportedLocales: [
              const Locale('en', 'US'),
              const Locale('zh', 'CN'),
            ],
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              S.delegate
            ],
            localeResolutionCallback:
                (Locale _locale, Iterable<Locale> supportedLocales) {
              if (localeModel.getLocale() != null) {
                return localeModel.getLocale();
              } else {
                Locale locale;
                if (supportedLocales.contains(_locale)) {
                  locale = _locale;
                } else {
                  locale = Locale('en', 'US');
                }
                return locale;
              }
            },
            routes: {
              Login.sname: (context) {
                return new Login();
              },
              Register.sname: (context) {
                return new Register();
              },
              Home.sname: (context) {
                return new Home();
              },
              UserCenter.sname: (context) {
                return new UserCenter();
              },
              RemoteTasksList.sname: (context) {
                return new RemoteTasksList();
              },
              NewTask.sname: (context) {
                return new NewTask();
              },
              LanguageRoute.sname: (context) {
                return new LanguageRoute();
              },
              ThemeChangeRoute.sname: (context) {
                return new ThemeChangeRoute();
              },
              LocalTasksList.sname: (context) {
                return new LocalTasksList();
              },
              NewLocalTask.sname: (context) {
                return new NewLocalTask();
              }
              // TaskList.sname: (context) {
              //   return new TaskList();
              // }
            },
          );
        },
      ),
    );
  }
}
