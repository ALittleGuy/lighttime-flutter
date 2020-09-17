import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lighttime_flutter/app.dart';
import 'package:lighttime_flutter/models/index.dart';
import 'package:lighttime_flutter/network/httpManager.dart';

void main() {
  runApp(App());
}


// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: Flutter(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter()  {
//     Response response;
//     Future.delayed(new Duration() , (){
//       print("================================");
//       print("================================");
//       handle();
//
//     });
//     print(response);
//
//
//     setState(() {
//       _counter++;
//     });
//   }
//
//   handle() async {
//     Dio dio = new Dio(BaseOptions(
//       baseUrl: "http://10.0.2.2:8080",
//       headers: {"Authorization" :  "Basic dXNlcjpwYXNz"},
//     ));
//     User user = new User();
//     user.id = 6;
//     user.username = "asdasdasd";
//     user.password = "1234";
//     user.phone = "asd";
//     user.email = "asd";
//     user.token = "2123";
//     print("======");
//     FormData data = FormData.fromMap(user.toJson());
//     Response response=await dio.post("/user" , data: data );
//
//     print(response.data);
//     print("------------");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//
//         title: Text(widget.title),
//       ),
//       body: Center(
//
//         child: Column(
//
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               ' have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
