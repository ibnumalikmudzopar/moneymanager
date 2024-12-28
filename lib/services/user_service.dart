import 'package:pengatur_keuangan/services/database_service.dart';

import '../models/user.dart';

class UserService {
  //CREATE
  Future<int> createUser(User user) async{
    final db = await DatabaseServices().database;
    return await db.insert('user', user.toMap());
  }

  //READ
  Future<List<User>> getUser() async {
    final db = await DatabaseServices().database;
    final List<Map<String, dynamic>> maps = await db.query('user');
    return List.generate(maps.length, (i){
      return User.fromMap(maps[i]);
    });
  }

  // UPDATE
Future<int> updateUser(User user) async {
  final db = await DatabaseServices().database;
  return await db.update(
    'user',
    user.toMap(),
    where: 'id = ?',
    whereArgs: [user.id]
  );
}

  // DELETE
Future<int> deleteUser(int id) async {
  final db = await DatabaseServices().database;
  return await db.delete('user', where: 'id = ?', whereArgs: [id]);
}
}