import 'dart:convert';

class Message{
  final int id;
  final String login;
  final String title;
  final String text;
  final String date;

  const Message({
    required this.id,
    required this.login,
    required this.title,
    required this.text,
    required this.date
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      login: json['login'],
      title: json['titulo'],
      text: json['texto'],
      date: json['fecha']
    );
  }
}