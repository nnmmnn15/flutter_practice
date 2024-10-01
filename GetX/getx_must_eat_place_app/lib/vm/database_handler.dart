import 'package:getx_must_eat_place_app/model/address.dart';
import 'package:getx_must_eat_place_app/vm/image_handler.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:get/state_manager.dart';

class DatabaseHandler extends ImageHandler {
  var addresses = <Address>[].obs;

  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'address.db'),
      onCreate: (db, version) async {
        await db.execute("""create table address(
              id integer primary key autoincrement,
              name text,
              phone text,
              estimate text,
              lat real,
              lng real,
              image blob,
              actiondate text
            )
          """);
      },
      version: 1,
    );
  }

  insertAddress(Address address) async {
    final Database db = await initializeDB();
    await db.rawInsert("""
        INSERT INTO address(name, phone, estimate, lat, lng, image, actiondate)
        VALUES (?, ?, ?, ?, ?, ?, datetime('now','localtime'))
      """, [
      address.name,
      address.phone,
      address.estimate,
      address.lat,
      address.lng,
      address.image,
    ]);
  }

  updateAddress(Address address) async {
    final Database db = await initializeDB();
    await db.rawInsert("""
        UPDATE address
        SET 
          name = ?,
          phone = ?,
          estimate = ?,
          lat = ?,
          lng = ?,
          image = ?
        WHERE
          id = ?
      """, [
      address.name,
      address.phone,
      address.estimate,
      address.lat,
      address.lng,
      address.image,
      address.id
    ]);
  }

  deleteAddress(int id) async {
    final Database db = await initializeDB();
    await db.rawDelete("""
        DELETE FROM address
        WHERE id = ?
      """, [id]);
  }

  queryAddress() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.rawQuery("""
        SELECT * FROM address
      """);
    addresses.value = queryResult.map((e) => Address.fromMap(e)).toList();
  }
}
