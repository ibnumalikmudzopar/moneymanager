class Categories {
  final int id;
  final String name_category;

  Categories({
    required this.id,
    required this.name_category,
  });

  // Convert Category to Map for database insertion
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name_category,
    };
  }

  // Create a Category object from a Map (for reading from the database)
  factory Categories.fromMap(Map<String, dynamic> map) {
    return Categories(
      id: map['id'],
      name_category: map['name_category'],
    );
  }
}
