//import 'package:easy_localization/easy_localization.dart';
//import 'package:garson/modle/cartItem.dart';
//import 'package:garson/modle/item.dart';
//import 'package:garson/utils/custom_exception.dart';
//import 'package:path/path.dart';
//import 'package:sqflite/sqflite.dart';
//
//class DatabaseHelper {
//  static Database _db;
//
//  Future<Database> get db async {
//    if (_db != null) return _db;
//    _db = await initDb();
//    return _db;
//  }
//
//  initDb() async {
//    var databasesPath = await getDatabasesPath();
//    String path = join(databasesPath, "garson.db");
//    var theDb = await openDatabase(path, version: 2, onCreate: _onCreate);
//    print(theDb.toString());
//    return theDb;
//  }
//
//
//  void _onCreate(Database db, int version) async {
//    // When creating the db, create the table
//    createTable(
//        db,
//        "CREATE TABLE User(userUID TEXT, userID INTEGER PRIMARY KEY, userName TEXT,"
//            " userCity TEXT, userEmail TEXT, userPhone TEXT, userDateBirth TEXT"
//            ", userRoleName TEXT)");
//    createTable(
//        db,
//        "CREATE TABLE Cart(itemID INTEGER , itemName TEXT,"
//            " itemQuantity INTEGER, brandUID TEXT, categoryID INTEGER, itemPrice Text)");
//  }
//
//  Future<void> createTable(Database db, String table) async {
//    await db.execute(table);
//  }
//  /////////////////////////////////////////////////////////
//
//
//  Future<int> updateData({String tableName , Map<String, dynamic> data}) async {
//    var dbClient = await db;
//    try {
//      return await dbClient.update(tableName, data);
//    } catch(e) {
//      throw MyException(error: 666,message:tr("an_error_occurred_please_try_again"));
//    }
//  }
//
//  Future<int> saveData({String tableName , Map<String, dynamic> data}) async {
//    var dbClient = await db;
//    try {
//      return await dbClient.insert(tableName, data);
//    } catch(e) {
//      throw MyException(error: 666,message: e.toString());
//    }
//  }
//  Future<dynamic> getData({String tableName , List<String> nameColumns}) async {
//    var dbClient = await db;
//    try{
//      List<Map> maps = await dbClient.query(tableName,columns: nameColumns);
//      if (maps.length > 0) {
//        return maps.first;
//      }
//    } catch(e) {
//      throw MyException(error: 666,message: tr("an_error_occurred_please_try_again"));
//    }
//    return null;
//  }
//  Future<int> deleteAllTable({String tableName}) async {
//    var dbClient = await db;
//    try{
//      return await dbClient.delete(tableName);
//    } catch(e) {
//      throw MyException(error: 666,message: tr("an_error_occurred_please_try_again"));
//    }
//  }
//
//  Future<int> addToCart(Item cartItem) async {
//    var dbClient = await db;
//    try {
//      // if(cartItem.itemQuantity==1){
//      return await dbClient.rawInsert(
//            'INSERT INTO Cart(itemID, itemName, itemQuantity, brandUID, categoryID, itemPrice) VALUES(?, ?, ?, ?, ?, ?)',
//            [cartItem.itemID, cartItem.itemName, cartItem.itemQuantity, cartItem.brandUID, cartItem.categoryID, cartItem.itemPrice]);
//      // }else {
//      //   await dbClient.rawUpdate(
//      //       'UPDATE Cart SET itemQuantity = ? WHERE itemID = ?',
//      //       [cartItem.itemQuantity, cartItem.itemID]);
//      // }
//     // List<Map> maps  =  await dbClient.query("Cart",columns: ['itemQuantity'],where: 'WHERE itemID = ?',whereArgs: [cartItem.itemID]);
//
//    } catch(e) {
//      print(e.toString());
//
//      throw MyException(error: 666,message: e.toString());
//    }
//  }
//  Future<int> removeFromCart(int id) async {
//    var dbClient = await db;
//    try {
//      return await dbClient.rawDelete("DELETE FROM Cart WHERE itemID = ?", [id]);
//    } catch(e) {
//      throw MyException(error: 666,message: e.toString());
//    }
//  }
//  Future<dynamic> getCartData() async {
//    var dbClient = await db;
//    try{
//      List<Map> maps = await dbClient.query("Cart",columns: null);
//        return maps;
//    } catch(e) {
//      throw MyException(error: 666,message: tr("an_error_occurred_please_try_again"));
//    }
//    return null;
//  }
//
//
//}
