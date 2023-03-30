import 'dart:convert';

class User {
  final String userName;
  final String urlImage;
  final bool aoVivo;

  User({
    required this.userName,
    required this.urlImage,
    required this.aoVivo,
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'urlImage': urlImage,
      'aoVivo': aoVivo,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userName: map['userName'] ?? '',
      urlImage: map['urlImage'] ?? '',
      aoVivo: map['aoVivo'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() =>
      'User(userName: $userName, urlImage: $urlImage, aoVivo: $aoVivo)';
}
