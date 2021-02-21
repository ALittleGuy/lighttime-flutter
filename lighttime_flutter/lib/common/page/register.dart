import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lighttime_flutter/generated/l10n.dart';
import 'package:lighttime_flutter/states/notifier.dart';
import 'package:lighttime_flutter/utils/regCheck.dart';
import 'package:provider/provider.dart';

import 'login.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  static final sname = "register";

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> _register_key = new GlobalKey();
  TextEditingController _username;
  TextEditingController _password;
  TextEditingController _email;
  TextEditingController _paswordComfirm;

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
                      key: _register_key,
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          new Container(
                            child: Text(
                              S.of(context).title,
                              style: new TextStyle(
                                fontSize: 23,
                                letterSpacing: 1.3,
                                fontWeight: FontWeight.w900,
                                color: Provider.of<ThemeModel>(context)
                                    .theme
                                    .withOpacity(0.6),
                              ),
                            ),
                            margin: EdgeInsets.only(top: 10, bottom: 10),
                          ),
                          TextFormField(
                            controller: _username,
                            decoration: InputDecoration(
                                labelText: S.of(context).YourUsername,
                                icon: Icon(Icons.person)),
                            onSaved: (value) {
                              _email.value = value.trim() as TextEditingValue;
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return S.of(context).UserNameIsNull;
                              }
                              if (!RegCheck.getInstance().isUsername(value)) {
                                return S.of(context).UsernameWrong;
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _email,
                            decoration: InputDecoration(
                                labelText: S.of(context).YourEmail,
                                icon: Icon(Icons.email)),
                            onSaved: (value) {
                              _email.value = new TextEditingValue(text: value);
                            },
                            validator: (value) {
                              if (value.trim().isEmpty ||
                                  !RegCheck.getInstance().isEmail(value)) {
                                return S.of(context).invalidEmail;
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _password,
                            decoration: InputDecoration(
                                labelText: S.of(context).YouPassword,
                                icon: Icon(Icons.lock_outlined)),
                            onSaved: (value) {
                              _password.value =
                                  value.trim() as TextEditingValue;
                            },
                            validator: (value) {
                              if (value.trim().isEmpty) {
                                return S.of(context).PasswordIsNull;
                              }
                              if (value.trim().length < 6) {
                                return S.of(context).PassWordLength;
                              }
                              if (value != _paswordComfirm.text) {
                                return S.of(context).PasswordIsDifferent;
                              }
                              return null;
                            },
                            obscureText: true,
                          ),
                          TextFormField(
                            controller: _paswordComfirm,
                            decoration: InputDecoration(
                                labelText: S.of(context).PasswordConfirm,
                                icon: Icon(Icons.lock_outlined)),
                            onSaved: (value) {
                              _paswordComfirm.value =
                                  value.trim() as TextEditingValue;
                            },
                            validator: (value) {
                              if (value.trim().isEmpty) {
                                return S.of(context).PasswordIsNull;
                              }
                              if (value.trim().length < 6) {
                                return S.of(context).PassWordLength;
                              }
                              if (value != _password.text) {
                                return S.of(context).PasswordIsDifferent;
                              }
                              return null;
                            },
                            obscureText: true,
                          ),
                          new Container(
                            margin: new EdgeInsets.only(top: 50),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                new Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  child: new FlatButton(
                                    onPressed: () {},
                                    shape: StadiumBorder(),
                                    child: Text(
                                      S.of(context).Signup,
                                      style: new TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 1.3),
                                    ),
                                    color: Provider.of<ThemeModel>(context)
                                        .theme
                                        .withOpacity(0.6),
                                    textColor: Colors.white,
                                    minWidth: 120,
                                  ),
                                ),
                                new Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  child: new FlatButton(
                                    shape: StadiumBorder(),
                                    onPressed: () => {},
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
                                    text: S.of(context).havaAccount,
                                    style:
                                        new TextStyle(color: Colors.black26)),
                                new TextSpan(
                                    text: S.of(context).signIn,
                                    style: new TextStyle(
                                        color: Provider.of<ThemeModel>(context)
                                            .theme,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14),
                                    recognizer: new TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushNamed(
                                            context, Login.sname);
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
}
