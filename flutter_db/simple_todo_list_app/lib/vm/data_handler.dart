import 'package:path/path.dart';
import 'package:simple_todo_list_app/model/todo.dart';
import 'package:sqflite/sqflite.dart';

class DataHandler{
  initializeDatabase()async{
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'todolist.db'),
      onCreate: (db, version) async {
        await db.execute(
          """
            create table todo(
              taskid integer primary key autoincrement,
              task text,
              insertdate text,
              taskcheck integer
            )
          """
        );
      },
      version: 1,
    );
  }

  Future<List<Todo>> queryTodoList() async{
    final Database db = await initializeDatabase();
    final List<Map<String, Object?>> queryResult = await db.rawQuery(
      """
        select * from todo;
      """
    );
    // print(queryResult);
    // dynamic a = queryResult.map((e) => Todo.fromMap(e)).toList();
    // Todo s = a[0];
    // print("???${s.taskCheck}");
    return queryResult.map((e) => Todo.fromMap(e)).toList();
  }

  Future<int> insertTodoList(Todo todo) async{
    var now = DateTime.now();
    int result = 0;
    final Database db = await initializeDatabase();
    result = await db.rawInsert(
      """
        insert into todo(task, insertdate, taskcheck) values (?, ?, 0)
      """, [todo.task, '${now.year}-${now.month}-${now.day}']
    );
    
    return result;
  }

  Future<int> deleteTodoList(int? id) async{
    int result = 0;
    final Database db = await initializeDatabase();
    result = await db.rawInsert(
      """
        delete from todo where taskid = ?
      """, [id]
    );
    
    return result;
  }

  checkTodoList(int? id, int? check) async{
    final Database db = await initializeDatabase();
    int checkTask = check == 1 ? 0 : 1;
    await db.rawInsert(
      """
        update todo set taskcheck = ? where taskid = ?
      """, [checkTask, id]
    );
  }


}