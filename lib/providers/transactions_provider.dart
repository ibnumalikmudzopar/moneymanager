import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/transactions.dart';
import '../services/transactions_service.dart';
import '../viewmodels/transactions_viewmodel.dart';

// Provider untuk TransactionService
final transactionsServiceProvider = Provider((ref) => TransactionsService());

// StateNotifierProvider untuk ViewModel
final transactionViewModelProvider = StateNotifierProvider<TransactionsViewModel, List<Transactions>>((ref) {
  final service = ref.watch(transactionsServiceProvider);
  return TransactionsViewModel(service);
});
