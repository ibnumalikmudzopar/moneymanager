import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/subcategories.dart';
import '../services/subcategories_service.dart';
import '../viewmodels/subcategories_viewmodel.dart';

// Provider untuk SubCategorieService
final subcategoriesServiceProvider = Provider((ref) => SubCategoriesService());

// StateNotifierProvider untuk ViewModel
final transactionViewModelProvider = StateNotifierProvider<SubCategoriesViewModel, List<SubCategories>>((ref) {
  final service = ref.watch(subcategoriesServiceProvider);
  return SubCategoriesViewModel(service);
});
