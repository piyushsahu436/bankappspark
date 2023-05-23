import 'package:app/model/customer_model.dart';
import 'package:app/model/transfer_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';


class DBTransferHelper {
  static Database? _db = null;
  static final int _version = 1;
  static final String _tableName = 'Transfers';
  static Future<void> initDb() async {
    print('/////////enter db');
    if (_db != null) {
      debugPrint('not null db');
      return;
    } else {
      try {
        String _path = await getDatabasesPath() + 'T.db';

        _db = await openDatabase(_path, version: 1,
            onCreate: (Database db, int version) async {
              // When creating the db, create the table
              await db.execute(
                'CREATE TABLE $_tableName (  key INTEGER PRIMARY KEY AUTOINCREMENT ,sender STRING, ids STRING  , reciever STRING ,idr STRING, value STRING,time STRING) ',
              );
              print('Created');
            });
      } catch (e) {
        print(e);
        print('Err');
      }
      print('out dp');
    }
  }

  static Future<int> insert(Transfer? transfer) async {
    print('insert');
    try {
      return _db!.insert(_tableName, transfer!.toJson());
    } catch (e) {
      print(e);
      print('we are here');
      return 9000000;
    }
  }


  static Future<dynamic> query() async {
    print('query');
    return await _db!.query(_tableName);
  }

}