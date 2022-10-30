import 'package:flutter/material.dart';
import 'package:proyecto1_curso/models/message.dart';


Container getContainerItem(Message message){
  return Container(
    margin: const EdgeInsets.all(30.0),
    padding: const EdgeInsets.all(20.0),
    decoration:  BoxDecoration(
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      border: Border.all(
        color: Colors.black,
        width: 2.0,
        style: BorderStyle.solid
      ),
      color: Colors.grey,
    ),
    child: Column(
      children: [
        
        Text("Fecha: ${message.date}",
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500
          )
        ),

        Text("Login: ${message.login}",
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500
          )
        ),
        
        Text("Titulo: ${message.title}",
          textAlign: TextAlign.center, 
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
          )
        ),

        Text("Descripción ${message.text}",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15
          )
        )
      ],
    ),
  );
}