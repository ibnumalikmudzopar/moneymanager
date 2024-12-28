import '../services/database_service.dart';
import '../models/categories.dart';

class CategoriesService {
  Future<int> addCategories(Categories categories) async {
    final db = await DatabaseServices().database;
    return await db.insert('categories', categories.toMap());
  }

  Future<List<Categories>> getCategories() async {
    final db = await DatabaseServices().database;
    final List<Map<String, dynamic>> maps = await db.query('categories');
    return List.generate(maps.length, (i) {
      return Categories.fromMap(maps[i]);
    });
  }

  Future<int> updateCategories(Categories categories) async {
    final db = await DatabaseServices().database;
    return await db.update(
      'categories',
      categories.toMap(),
      where: 'id = ?',
      whereArgs: [categories.id],
    );
  }

  Future<int> deleteCategories(int id) async {
    final db = await DatabaseServices().database;
    return await db.delete('categories', where: 'id = ?', whereArgs: [id]);
  }
}
