import 'package:flutter/scheduler.dart';
import 'package:lighttime_flutter/channel/taskChannel.dart';
import 'package:lighttime_flutter/common/models/task.dart';
import 'package:lighttime_flutter/common/models/taskStatus.dart';
import 'package:lighttime_flutter/redux/lighttime_state.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseServer {
  static DatabaseServer _instance;

  DatabaseServer._internal();

  factory DatabaseServer.getInstance() => _getInstance();

  static _getInstance() {
    if (_instance == null) {
      _instance = DatabaseServer._internal();
    }
    return _instance;
  }

  final String _TABLE_INIT = '''
  CREATE TABLE `task` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT ,
  `principal` varchar(30) DEFAULT NULL,
  `sponsor` varchar(30) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL ,
  `content` varchar(256) DEFAULT NULL ,
  `deadline` timestamp  DEFAULT '2000-00-00 00:00:00',
  `lauchdate` timestamp  DEFAULT '2000-00-00 00:00:00',
  `status` smallint(6) DEFAULT NULL ,
  `catalog` smallint(6) DEFAULT NULL ,
  `tag` varchar(256) DEFAULT NULL
  )  ;

  ''';

  Database _database;

  init() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'lighttime');
    _database = await openDatabase(path, version: 3,
        onCreate: (Database db, int version) {
      return db.execute(_TABLE_INIT);
    });
    print(_database.path);
  }

  insert(Task task) async {
    if (_database == null) {
      init();
    }
    await _database.insert('task', task.toJson());
  }

  selectAllTask() {
    _database.query('task').then((value) {
      print(value);
      return List.generate(
          value.length, (index) => Task.fromJson(value[index]));
    });
  }

  Future<List<Task>> selectTasksByStatus(TaskStatus status) async {
    // await List<Map<Stirng  dynamic>> maps = _database.query('task', where: "status = ${status.index}");
    final List<Map<String, dynamic>> maps =
        await _database.query('task', where: "status = ${status.index}");
    return List.generate(maps.length, (index) {
      return Task.fromJson(maps[index]);
    });
  }

  deleteTaskById(int id) {
    _database.delete('task', where: 'id = $id').then((value) => value);
  }

  updateTask(Task task) {
    _database.update('task', task.toJson(),
        where: "id = ?", whereArgs: [task.id]).then((value) => value);
  }

  deleteTask(int id) {
    _database.delete('task', where: "id = $id").then((value) => value);
  }
}
