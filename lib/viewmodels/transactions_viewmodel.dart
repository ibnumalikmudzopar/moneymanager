import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/transactions.dart';
import '../services/transactions_service.dart';

class TransactionsViewModel extends StateNotifier<List<Transactions>> {
  final TransactionsService _service;

  TransactionsViewModel(this._service) : super([]);

  Future<void> loadTransactions() async {
    final transactions = await _service.getTransactions();
    state = transactions;
  }

  Future<void> addTransactions(Transactions transactions) async {
    await _service.addTransactions(transactions);
    loadTransactions();
  }

  Future<void> updateTransactions(Transactions transactions) async {
    await _service.updateTransactions(transactions);
    loadTransactions();
  }

  Future<void> deleteTransactions(int id) async {
    await _service.deleteTransaction(id);
    loadTransactions();
  }
}
