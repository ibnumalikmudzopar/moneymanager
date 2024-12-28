import '../services/database_service.dart';
import '../models/subcategories.dart';

class SubCategoriesService {
  Future<int> addSubCategories(SubCategories subcategories) async {
    final db = await DatabaseServices().database;
    return await db.insert('subcategories', subcategories.toMap());
  }

  Future<List<SubCategories>> getSubCategories() async {
    final db = await DatabaseServices().database;
    final List<Map<String, dynamic>> maps = await db.query('subcategories');
    return List.generate(maps.length, (i) {
      return SubCategories.fromMap(maps[i]);
    });
  }

  Future<int> updateSubCategories(SubCategories subcategories) async {
    final db = await DatabaseServices().database;
    return await db.update(
      'subcategories',
      subcategories.toMap(),
      where: 'id = ?',
      whereArgs: [subcategories.id],
    );
  }

  Future<int> deleteSubCategories(int id) async {
    final db = await DatabaseServices().database;
    return await db.delete('subcategories', where: 'id = ?', whereArgs: [id]);
  }
}
