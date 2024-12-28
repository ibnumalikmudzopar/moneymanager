class SubCategories {
  final int id;
  final String nameSubcategory;
  final int categoriesId; // Foreign key to Categories

  SubCategories({
    required this.id,
    required this.nameSubcategory,
    required this.categoriesId,
  });

  // Convert SubCategories to Map for database insertion
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name_subcategory': nameSubcategory,
      'categories_id': categoriesId,
    };
  }

  // Create a SubCategories object from a Map (for reading from the database)
  factory SubCategories.fromMap(Map<String, dynamic> map) {
    return SubCategories(
      id: map['id'],
      nameSubcategory: map['name_subcategory'],
      categoriesId: map['categories_id'],
    );
  }
}
