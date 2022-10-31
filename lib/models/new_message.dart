// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

// NewMessage newMessageFromJson(String str) =>
//     NewMessage.fromJson(json.decode.toString());

// String newMessageToJson(NewMessage data) => json.encode(data.toJson());

class NewMessage {
  NewMessage({
    this.id,
    required this.login,
    required this.titulo,
    required this.texto,
    this.fecha,
  });

  int? id;
  String login;
  String titulo;
  String texto;
  DateTime? fecha;

  // factory NewMessage.fromJson(String str) =>
  //     NewMessage.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  factory NewMessage.fromMap(Map<String, dynamic> json) => NewMessage(
        id: json["id"],
        login: json["login"],
        titulo: json["titulo"],
        texto: json["texto"],
        fecha: DateTime.parse(json["fecha"]),
      );

  // Map<String, dynamic> toMap() => {
  //       "id": id,
  //       "login": login,
  //       "titulo": titulo,
  //       "texto": texto,
  //     };
}
