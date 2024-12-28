import '../models/categories.dart';
import '../services/categories_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesViewModel extends StateNotifier<List<Categories>> {
  final CategoriesService _service;

  CategoriesViewModel(this._service) : super([]);

  Future<void> getCategories() async {
    final categories = await _service.getCategories();
    state = categories;
  }

  Future<void> addCategories(Categories categories) async {
    await _service.addCategories(categories);
    getCategories();
  }

  Future<void> updateCategories(Categories categories) async {
    await _service.updateCategories(categories);
    getCategories();
  }

  Future<void> deleteCategories(int id) async {
    await _service.deleteCategories(id);
    getCategories();
  }
}