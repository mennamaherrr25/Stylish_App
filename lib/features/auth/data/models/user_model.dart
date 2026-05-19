class UserModel {
  final String email;
  final String name;
  final String password;
  final String role;
  final String avatar;

  UserModel({
    required this.email,
    required this.name,
    required this.password,
    required this.role,
    required this.avatar,
  });

  // From Json
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      name: json['name'],
      password: json['password'],
      role: json['role'],
      avatar: json['avatar'],
    );
  }

  // To Json
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'password': password,
      'role': role,
      'avatar': avatar,
    };
  }
}
