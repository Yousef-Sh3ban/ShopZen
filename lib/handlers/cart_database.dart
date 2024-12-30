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
    price REAL,
    quantity INTEGER DEFAULT 1
  )
''');
      },
      version: 1,
    );
  }

  Future<void> insertCartItem(CartItem item) async {
    final db = await database;

    final existingItem = await db.query(
      'cart_items',
      where: 'id = ?',
      whereArgs: [item.id],
    );

    if (existingItem.isNotEmpty) {
      final currentQuantity = existingItem.first['quantity'] as int;
      await db.update(
        'cart_items',
        {'quantity': currentQuantity + 1},
        where: 'id = ?',
        whereArgs: [item.id],
      );
    } else {
      await db.insert(
        'cart_items',
        item.toMap()..['quantity'] = 1,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<CartItem>> getCartItems() async {
    final db = await database;
    final List<Map<String, dynamic>> cartData = await db.query('cart_items');

    return cartData.map((item) {
      return CartItem(
          id: item['id'] as int,
          title: item['title'] as String,
          image: item['image'] as String,
          price: item['price'] as double,
          quantity: item['quantity'] as int // Include quantity
          );
    }).toList();
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
