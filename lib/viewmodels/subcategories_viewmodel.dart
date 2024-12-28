import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/subcategories.dart';
import '../services/subcategories_service.dart';

class SubCategoriesViewModel extends StateNotifier<List<SubCategories>> {
  final SubCategoriesService _service;

  SubCategoriesViewModel(this._service) : super([]);

  Future<void> getSubCategories() async {
    final subcategories = await _service.getSubCategories();
    state = subcategories;
  }

  Future<void> addSubCategories(SubCategories subcategories) async {
    await _service.addSubCategories(subcategories);
    getSubCategories();
  }

  Future<void> updateSubCategories(SubCategories subcategories) async {
    await _service.updateSubCategories(subcategories);
    getSubCategories();
  }

  Future<void> deleteSubCategories(int id) async {
    await _service.deleteSubCategories(id);
    getSubCategories();
  }
}