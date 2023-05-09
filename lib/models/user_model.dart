class User {
  String id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;

  User({
    this.id = '',
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'username': username,
        'email': email,
      };
}
