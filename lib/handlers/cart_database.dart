import 'dart:async';
import 'package:base/features/cart/domain/models/cart_item.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CartDatabaseHelper {
  static final CartDatabaseHelper _instance = CartDatabaseHelper._internal();
  static final CartDatabaseHelper instance = CartDatabaseHelper._internal();

  static Database? _database;

  CartDatabaseHelper._internal();

  factory CartDatabaseHelper() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'cart.db'),
      onCreate: (db, version) {
        return db.execute('''
  CREATE TABLE cart_items (
    id INTEGER PRIMARY KEY,
    title TEXT,
    image TEXT,
    price REAL
  )
''');
      },
      version: 1,
    );
  }

  Future<void> insertCartItem(CartItem item) async {
    final db = await database;
    await db.insert(
      'cart_items',
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<CartItem>> getCartItems() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('cart_items');

    return List.generate(maps.length, (i) {
      return CartItem(
        id: maps[i]['id'],
        title: maps[i]['title'],
        image: maps[i]['image'],
        price: maps[i]['price'],
        quantity: 1, 
      );
    });
  }

  Future<void> deleteCartItem(int id) async {
    final db = await database;
    await db.delete(
      'cart_items',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

}
