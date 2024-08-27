import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_app/model/students.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      // 경로에 db파일이 있는지 확인
      join(path, 'student.db'),
      // DB가 존재하지 않을 때 생성
      onCreate: (db, version) async {
        await db.execute("""
          create table students (
            seq integer primary key autoincrement,
            code text,
            name text,
            dept text,
            phone text)
        """);
      },
      version: 1,
    );
  }

  Future<int> insertStudents(Students student) async {
    int result = 0;
    // db
    final Database db = await initializeDB();
    // insert
    // 1번째 데이터 = 1, 2번째 데이터 = 2 , 에러 = 0
    result = await db.rawInsert(
      """
        insert into students(code, name, dept, phone)
        values(?,?,?,?)
      """, [student.code, student.name, student.dept, student.phone]
    );
    print('Insert return value : $result');
    return result;
  }

  Future<List<Students>> queryStudents() async{
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResults = await db.rawQuery(
      """
        select * from students;
      """
    );
    print(queryResults);
    return queryResults.map((e) => Students.fromMap2(e)).toList();
  }

  Future<int> updateStudents(Students student) async {
    int result = 0;
    // db
    final Database db = await initializeDB();
    // insert
    // 1번째 데이터 = 1, 2번째 데이터 = 2 , 에러 = 0
    result = await db.rawUpdate(
      """
        update students set name = ?, dept = ?, phone = ? where code = ?
      """, [student.name, student.dept, student.phone, student.code]
    );
    print('update return value : $result');
    return result;
  }

  Future<int> deleteStudents(String code) async {
    int result = 0;
    // db
    final Database db = await initializeDB();
    result = await db.rawDelete(
      """
        delete from students where code = ?
      """, [code]
    );
    print('delete return value : $result');
    return result;
  }
} // End
