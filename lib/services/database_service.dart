import 'package:sqflite_sqlcipher/sqflite.dart';
import 'package:path/path.dart';

class DatabaseServices {
  static final DatabaseServices _instance = DatabaseServices._internal();
  static Database? _database;

  DatabaseServices._internal();

  factory DatabaseServices() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'encrypted_money_manager.db');
    
    // kunci enkripsi untuk membuka atau membuat database terenkripsi
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      password: 'admin', //kunci enkripsi 
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE user (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      email TEXT,
      password TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE categories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name_category TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE subcategories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name_subcategory TEXT,
        categoriesId INTEGER,
        FOREIGN KEY (categoriesId) REFERENCES categories (id) ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE transactions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT,
        categoriesId INTEGER,
        subcategoriesId INTEGER,
        amount REAL,
        description TEXT, 
        FOREIGN KEY (categoriesId) REFERENCES categories (id), 
        -- categoryId akan mengambil nilai id dari tabel categories
        FOREIGN KEY (subcategoriesId) REFERENCES subcategories (id)
      )
    ''');
  }

  
}
//  BAGAIMANA MENAMBAH TABEL BARU KETIKA KODE INI SUDAH DIJALANKAN, KEKNYA MUNGKIN AJA AUTO TINGGAL ADD CODE
