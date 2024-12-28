// mengambil data, CRUD data

import '../models/transactions.dart';
import '../services/database_service.dart';

// class TransactionService {
//   // Misalkan ini interaksi ke database lokal (bisa SQLite, Firebase, dll)
//   Future<List<Transaction>> fetchTransactions() async {
//     // Ini hanya contoh, data bisa datang dari mana saja
//     return [
//       // Transaction(id: '1', title: 'Beli Kopi', amount: 15.000, date: DateTime.now()),
//       // Transaction(id: '2', title: 'Belanja Bulanan', amount: 500.000, date: DateTime.now())
//     ];
//   }
// }

class TransactionsService {
  Future<int> addTransactions(Transactions transactions) async {
    final db = await DatabaseServices().database;
    return await db.insert('transactions', transactions.toMap());
  }

  Future<List<Transactions>> getTransactions() async {
    final db = await DatabaseServices().database;
    final List<Map<String, dynamic>> maps = await db.query('transactions');
    return List.generate(maps.length, (i) {
      return Transactions.fromMap(maps[i]);
    });
  }

  Future<int> updateTransactions(Transactions transactions) async {
    final db = await DatabaseServices().database;
    return await db.update(
      'transactions',
      transactions.toMap(),
      where: 'id = ?',
      whereArgs: [transactions.id],
    );
  }

  Future<int> deleteTransaction(int id) async {
    final db = await DatabaseServices().database;
    return await db.delete('transactions', where: 'id = ?', whereArgs: [id]);
  }
}
