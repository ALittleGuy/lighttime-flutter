import 'package:flutter/material.dart';
import 'package:lighttime_flutter/page/login.dart';
import 'package:lighttime_flutter/page/register.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("轻时间"),
      ),
      body: _buildBody(),
    );
  }
  Widget _buildBody(){
    if(true){
      return new Container(
        child: new Center(
          child: new Padding(
            padding: EdgeInsets.all(30),
            child: new RaisedButton(onPressed: ()=>Navigator.pushNamed(context, Login.sname) ),
          ),
        ),
      );
    }
  }

}