// membuat struktur data
// struktur data
// kelas sederhana yang memetakan data dari API atau database.

class Transactions {
  final int id;
  final double amount;
  final String description;
  final DateTime date;
  final int categoryId;
  final int subCategoryId;

  Transactions({
    required this.id,
    required this.amount,
    required this.description,
    required this.date,
    required this.categoryId,
    required this.subCategoryId,
  });

  // Convert Transaction object to Map (to insert into database)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'description': description,
      'date': date.toIso8601String(),
      'categoryId': categoryId,
      'subCategoryId': subCategoryId,
    };
  }

  // Create a Transaction object from a Map (when reading from database)
  factory Transactions.fromMap(Map<String, dynamic> map) {
    return Transactions(
      id: map['id'],
      amount: map['amount'],
      description: map['description'],
      date: DateTime.parse(map['date']),
      categoryId: map['categoryId'],
      subCategoryId: map['subCategoryId'],
    );
  }
}
