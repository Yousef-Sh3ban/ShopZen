
import 'package:base/features/home_screen/domain/models/product_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _database;//
  static final DBHelper instance = DBHelper._init();//

  DBHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('favorites.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final String path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE favorites (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      imageUrl TEXT,
      title TEXT,
      price REAL,
      oldPrice REAL,
      rating REAL,
      reviewsCount INTEGER,
      isFavorite INTEGER
    )
    ''');
  }

  Future<void> insertProduct(ProductModel product) async {
    final db = await database;
    await db.insert('favorites', product.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<ProductModel>> getFavorites() async {
    final db = await database;
    final result = await db.query('favorites');
    return result.map((json) => ProductModel.fromJsonForDB(json)).toList();
  }

  Future<void> deleteProduct(int id) async {
    final db = await database;
    await db.delete('favorites', where: 'id = ?', whereArgs: [id]);
  }

  Future<bool> isProductFavorite(int? id) async {
    if (id == null) {
      return false;
    }

    final db = await database;
    final result = await db.query(
      'favorites',
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty;
  }
}
