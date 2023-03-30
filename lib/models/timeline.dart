import 'dart:convert';

class Timeline {
  final String urlPerfil;
  final String userName;
  final String urlImage;
  final int curtidas;
  final int comentarios;
  final String descricao;

  Timeline({
    required this.urlPerfil,
    required this.userName,
    required this.urlImage,
    required this.curtidas,
    required this.comentarios,
    required this.descricao,
  });

  Map<String, dynamic> toMap() {
    return {
      'urlPerfil': urlPerfil,
      'userName': userName,
      'urlImage': urlImage,
      'curtidas': curtidas,
      'comentarios': comentarios,
      'descricao': descricao,
    };
  }

  factory Timeline.fromMap(Map<String, dynamic> map) {
    return Timeline(
      urlPerfil: map['urlPerfil'] ?? '',
      userName: map['userName'] ?? '',
      urlImage: map['urlImage'] ?? '',
      curtidas: map['curtidas']?.toInt() ?? 0,
      comentarios: map['comentarios']?.toInt() ?? 0,
      descricao: map['descricao'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Timeline.fromJson(String source) =>
      Timeline.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Timeline(urlPerfil: $urlPerfil, userName: $userName, urlImage: $urlImage, curtidas: $curtidas, comentarios: $comentarios, descricao: $descricao)';
  }
}
