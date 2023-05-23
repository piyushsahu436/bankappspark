import 'package:app/model/customer_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';


class DBCustomerHelper {
  static Database? _db = null;
  static final int _version = 1;
  static final String _tableName = 'customer';
  static Future<void> initDb() async {
    print('enter db');
    if (_db != null) {
      debugPrint('not null db');
      return;
    } else {
      try {
        String _path = await getDatabasesPath() + 'C.db';

        _db = await openDatabase(_path, version: 1,
            onCreate: (Database db, int version) async {
              // When creating the db, create the table
              await db.execute(
                'CREATE TABLE $_tableName (  name STRING, id STRING PRIMARY KEY , phone STRING ,gender STRING, socialNumber STRING, dateOfBirth STRING, balance STRING, nationality STRING ) ',
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

  static Future<int> insert(Customer? customer) async {
    print('insert');
    try {
      return _db!.insert(_tableName, customer!.toJson());
    } catch (e) {
      print(e);
      print('we are here');
      return 9000000;
    }
  }

  static Future<int> update(String id, String newBalance) async {
    print('update');
    return await _db!
        .rawUpdate('UPDATE $_tableName SET balance = ? Where id = ?', [newBalance, id]);
  }
  static Future<dynamic> query() async {
    print('query');
    return await _db!.query(_tableName);
  }

}