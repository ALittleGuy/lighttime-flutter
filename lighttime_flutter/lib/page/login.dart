import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  static final sname = "login_page";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String _username;

  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        child: new Center(
          child: SafeArea(
            child: new SingleChildScrollView(
              child: new Card(
                elevation: 5,
                margin: new EdgeInsets.only(left: 30 , right: 30 , bottom: 50),
                shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: new Padding(
                  padding: new EdgeInsets.all(20),
                  child: new Form(child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Ligth Time"),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "请输入邮箱",
                        ),
                        onSaved: (value){
                          _username = value;
                        },
                        validator: (value){
                          return value!=null ? "邮箱不能为空":null;
                        },
                      ),

                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "请输入密码"
                        ),
                        onSaved: (value){
                          _password = value;
                        },
                        validator: (value){
                          return value!=null ? "密码不能为空" : null;
                        },
                        obscureText: true,
                      ),

                      new Container(
                        margin: new EdgeInsets.only(top: 20),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            new Container(
                              margin: EdgeInsets.only(left: 20 , right: 20),
                              child: new RaisedButton(onPressed: null,
                                child: Text("登录"),),
                            ),
                            new Container(
                              margin: EdgeInsets.only(left: 20 , right: 20),
                              child: new RaisedButton(onPressed: null,
                                child: Text("注册"),),
                            ),

                          ],
                        ),
                      )
                    ],
                  )),),

              ),
            ),
          ),
        ),
      ),
    );
  }
}
