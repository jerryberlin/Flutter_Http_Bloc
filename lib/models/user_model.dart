class UserModel {
  final int id;
  final String email;
  final String firstname;
  final String lastname;
  final String avatar;
  UserModel(
    {required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.avatar}
  );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'], 
        email: json['email'], 
        firstname: json['first_name'] ?? 'First Name', 
        lastname: json['last_name'] ?? 'Last Name', 
        avatar: json['avatar'] ?? 'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D'
      );
  }
}