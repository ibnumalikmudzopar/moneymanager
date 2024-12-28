import '../models/user.dart';
import '../services/user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserViewModel extends StateNotifier<List<User>> {
  final UserService _service;

  UserViewModel(this._service) : super([]);

  Future<void> getUser() async {
    final user = await _service.getUser();
    state = user;
  }

  Future<void> createUser(User user) async {
    await _service.createUser(user);
    getUser();
  }

  Future<void> updateUser(User user) async {
    await _service.updateUser(user);
    getUser();
  }

  Future<void> deleteUser(int id) async {
    await _service.deleteUser(id);
    getUser();
  }
}