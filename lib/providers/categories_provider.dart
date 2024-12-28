import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/categories.dart';
import '../services/categories_service.dart';
import '../viewmodels/categories_viewmodel.dart';

// Provider untuk categorieservice
final categoriesServiceProvider = Provider((ref) => CategoriesService());

// StateNotifierProvider untuk ViewModel
final transactionViewModelProvider = StateNotifierProvider<CategoriesViewModel, List<Categories>>((ref) {
  final service = ref.watch(categoriesServiceProvider);
  return CategoriesViewModel(service);
});
