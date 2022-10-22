import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto1_curso/models/message.dart';

class ApiProvider extends ChangeNotifier{

  List<Message> listOfMessages = [];

  ApiProvider(){
    getOnDisplayMessages();
  }

  getOnDisplayMessages() async {
    const String messageURL = 'https://40fd422c6d4d.sa.ngrok.io/api/mensajes';

    final response =  await http.get(Uri.parse(messageURL));

    if(response.statusCode == 200){
      listOfMessages = _parseMessages(response.body);

      for(Message message in listOfMessages){
        _showMessageInfo(message);
      }
    }
    notifyListeners();
  }

  List<Message> _parseMessages(String responseBody) {
    final parsedOutput = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsedOutput.map<Message>((json) => Message.fromJson(json)).toList();
  }

  void _showMessageInfo(Message message){
    log(message.text);
  }

}