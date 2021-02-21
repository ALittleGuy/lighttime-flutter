// This is a basic Flutter widget test.
// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:lighttime_flutter/common/global.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);
    //
    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();
    //
    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
    //
    // print("================");
    // print("================");

    // Dio dio = new Dio(BaseOptions(
    //   baseUrl: "https://baidu.com" ,
    // ));
    // Future.delayed(Duration() , (){
    //   print(dio.get("/"));
    // }).then((value) => {
    // });

    // User user = new User();
    // user.id = 3;
    // user.username = "zrrh";
    // user.password="asdasd";
    // Dio dio = new Dio(BaseOptions(
    //     baseUrl: 'http://127.0.0.1:8080/',
    //     headers: {"Authorization": "Basic dXNlcjpwYXNz"}));
    //
    // Response r = dio.get("/user") as Response;
    // print(r.data);
    // IOWebSocketChannel _channel = IOWebSocketChannel.connect(
    //     "ws://10.0.2.2:6250/websocket/test/1@qq.com");
    //
    // _channel.sink.add("asdasdasdsad");
    // _channel.stream.listen((event) {
    //   print(event.toString());
    // });

    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'lighttime');
    print("数据库路径:$path");

    print(Global.profile.token);
  });
}
