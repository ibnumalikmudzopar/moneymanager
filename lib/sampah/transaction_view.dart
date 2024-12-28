import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/transactions_provider.dart';

class TransactionView extends ConsumerWidget {
  const TransactionView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(transactionViewModelProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Transactions')),
      body: transactions.isEmpty
          ? Center(child: Text('No transactions found'))
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return ListTile(
                  title: Text(transaction.subCategoryId.toString()),
                  subtitle: Text(transaction.amount.toString()),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                     
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aksi untuk menambah transaksi
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
