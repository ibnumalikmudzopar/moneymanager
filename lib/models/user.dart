class User {
  final String id;
  final String name;
  final String email;
  final String password;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password
  });

  //  CONVERT USER OBJEK TO MAP(TO INSERT INTO DATABASE)
  // struktur map?
  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password
    };
  }
  // Create a Transaction object from a Map (when reading from database)
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      );
  }
}