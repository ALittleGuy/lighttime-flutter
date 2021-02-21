import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lighttime_flutter/channel/websocketUtil.dart';
import 'package:lighttime_flutter/common/api/behaviour.dart';
import 'package:lighttime_flutter/common/global.dart';
import 'package:lighttime_flutter/common/models/index.dart';
import 'package:lighttime_flutter/common/page/register.dart';
import 'package:lighttime_flutter/generated/l10n.dart';
import 'package:lighttime_flutter/redux/lighttime_state.dart';
import 'package:lighttime_flutter/redux/token_redux.dart';
import 'package:lighttime_flutter/states/notifier.dart';
import 'package:lighttime_flutter/utils/regCheck.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);
  static final sname = "login_page";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _loginFormKey = new GlobalKey();
  TextEditingController _email;
  TextEditingController _password;
  TextEditingController _message;
  static int _isInit = 1;

  @override
  void initState() {
    // TODO: implement initState
    _email = new TextEditingController();
    _password = new TextEditingController();
    _message = new TextEditingController();
    if (_isInit == 1) {
      _isInit = 2;
      String token = Global.profile.token;
      if (token != null) {
        Behaviour().tokenValidate(token).then((value) {
          if (value) {
            Navigator.pushNamed(context, Home.sname);
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        child: new Center(
          child: SafeArea(
            child: new SingleChildScrollView(
              child: new Card(
                elevation: 5,
                margin: new EdgeInsets.only(left: 30, right: 30, bottom: 50),
                shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: new Padding(
                  padding: new EdgeInsets.all(20),
                  child: new Form(
                      key: _loginFormKey,
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          new Container(
                            child: Text(
                              S.of(context).title,
                              style: new TextStyle(
                                  fontSize: 23,
                                  color: Provider.of<ThemeModel>(context)
                                      .theme
                                      .withOpacity(0.6),
                                  letterSpacing: 1.3,
                                  fontWeight: FontWeight.w900),
                            ),
                            margin: EdgeInsets.only(top: 10, bottom: 10),
                          ),
                          TextFormField(
                            controller: _email,
                            decoration: InputDecoration(
                              icon: Icon(Icons.email),
                              labelText: S.of(context).enterEmail,
                            ),
                            onSaved: (value) {
                              _email.value = new TextEditingValue(text: value);
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return S.of(context).EmailIsNull;
                              } else if (!RegCheck.getInstance()
                                  .isEmail(value)) {
                                return S.of(context).EmailWrong;
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _password,
                            decoration: InputDecoration(
                                icon: Icon(Icons.lock_outline_sharp),
                                labelText: S.of(context).enterPassword),
                            onSaved: (value) {
                              _password.value =
                                  new TextEditingValue(text: value);
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return S.of(context).PasswordIsNull;
                              }
                              return null;
                            },
                            obscureText: true,
                          ),
                          new Container(
                            margin: new EdgeInsets.only(top: 10),
                            child: Center(
                              child: new TextField(
                                textAlign: TextAlign.center,
                                controller: _message,
                                enabled: false,
                                style: new TextStyle(
                                  fontSize: 16,
                                  color: Colors.red,
                                ),
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                              ),
                            ),
                          ),
                          new Container(
                            margin: new EdgeInsets.only(top: 10),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                new Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  child: new FlatButton(
                                    onPressed: login,
                                    shape: StadiumBorder(),
                                    child: Text(
                                      S.of(context).signIn,
                                      style: new TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 1.3),
                                    ),
                                    color:
                                        Provider.of<ThemeModel>(context).theme,
                                    textColor: Colors.white,
                                    minWidth: 120,
                                  ),
                                ),
                                new Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  child: new FlatButton(
                                    shape: StadiumBorder(),
                                    onPressed: () => {
                                      Navigator.pushNamed(context, Home.sname)
                                    },
                                    child: Text(S.of(context).guest),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new Container(
                            margin: new EdgeInsets.only(top: 10),
                            child: new Center(
                                child: RichText(
                              text: new TextSpan(children: [
                                new TextSpan(
                                    text: S.of(context).noAccount,
                                    style:
                                        new TextStyle(color: Colors.black26)),
                                new TextSpan(
                                    text: S.of(context).signUpRightNow,
                                    style: new TextStyle(
                                        color: Provider.of<ThemeModel>(context)
                                            .theme,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14),
                                    recognizer: new TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushNamed(
                                            context, Register.sname);
                                      })
                              ]),
                            )),
                          )
                        ],
                      )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  login() async {
    // var _loginFormState = _loginFormKey.currentState;
    // if (_loginFormState.validate()) {
    //   _loginFormState.save();
    //   print(_email.text + " " + _password.text);
    //   Map<String, dynamic> response;
    //   await (new Behaviour().login(_email.text, _password.text))
    //       .then((value) => {response = json.decode(value)});
    //   if (response['code'] == 102) {
    //     print(response['token']);
    //     _message.text = response['message'];
    //     StoreConnector<LightTimeState, VoidCallback>(
    //         converter: (store) {
    //           return () =>
    //               store.dispatch(TokenUpdateAction(response["data"]["token"]));
    //         },
    //         builder: (context, callback) {});
    //     // Navigator.pushNamedAndRemoveUntil(context, Home.sname, (route) => route ==null);
    //     Navigator.pushNamedAndRemoveUntil(
    //         context, Home.sname, (route) => false);
    //   } else {
    //     _message.text = response['message'];
    //   }
    // }

    var _loginFormState = _loginFormKey.currentState;
    if (_loginFormState.validate()) {
      _loginFormState.save();
      print(_email.text + " " + _password.text);
      Map<String, dynamic> response;
      await (new Behaviour().login(_email.text, _password.text))
          .then((value) => {response = json.decode(value)});
      if (response['code'] == 102) {
        print(response['data']);
        _message.text = response['message'];
        User user = new User.fromJson(response["data"]);
        Provider.of<TokenModel>(context, listen: false).token = user.token;
        Provider.of<UserModel>(context, listen: false).user = user;

        Global.saveProfile();
        TaskChannelInit();
        // Navigator.pushNamedAndRemoveUntil(context, Home.sname, (route) => route ==null);
        Navigator.pushNamedAndRemoveUntil(
            context, Home.sname, (route) => false);
      } else {
        _message.text = response['message'];
      }
    }
  }
}
