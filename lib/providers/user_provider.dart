import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';
import '../services/user_service.dart';
import '../viewmodels/user_viewmodel.dart';

// Provider untuk userervice
final userServiceProvider = Provider((ref) => UserService());

// StateNotifierProvider untuk ViewModel
final transactionViewModelProvider = StateNotifierProvider<UserViewModel, List<User>>((ref) {
  final service = ref.watch(userServiceProvider);
  return UserViewModel(service);
});
