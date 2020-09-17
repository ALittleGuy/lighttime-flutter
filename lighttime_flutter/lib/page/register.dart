import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  static final sname = "register";

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("data"),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: [
              new Text("asd"),

            ],
          )
        ),
      ),
    );
  }
}