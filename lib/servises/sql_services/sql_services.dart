import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class SqlServices {
  static late Database database;
  static Future<void> initDb() async {
    if (kIsWeb) {
      databaseFactory = databaseFactoryFfiWeb;
    }
    database = await openDatabase(
      "cart.db",
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE cart (id INTEGER PRIMARY KEY, name TEXT,img TEXT, qty INTEGER, price REAL)',
        );
      },
    );
  }

  static Future<List<Map>> getData() async {
    List<Map> data = await database.query("cart");
    log(data.toString());
    return data;
  }

  static Future<void> addData(Map<String, dynamic> data) async {
    await database.insert("cart", data);
  }

  static Future<void> editData({
    required int qty,
    required int prodcutId,
  }) async {
    await database.update(
      "cart",
      {"qty": qty},
      where: 'id = ?',
      whereArgs: [prodcutId],
    );
  }

  static Future<void> deleteData(int productId) async {
    await database.delete("cart", where: 'id = ?', whereArgs: [productId]);
  }
}
