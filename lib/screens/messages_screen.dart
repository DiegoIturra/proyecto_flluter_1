import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:proyecto1_curso/models/message.dart';
import 'package:proyecto1_curso/providers/api_provider.dart';
import 'package:provider/provider.dart';
import 'package:proyecto1_curso/screens/members_screen.dart';
import 'package:proyecto1_curso/screens/screens.dart';
import 'package:proyecto1_curso/widgets/message_list_item.dart';

class MesssagesScreen extends StatelessWidget{
  const MesssagesScreen({Key? key}) : super(key: key);

  Text getTextOnListTile(String text){
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {

    final ApiProvider characterProvider = Provider.of<ApiProvider>(context);
    int numberOfMessages = characterProvider.listOfMessages.length;

    return Scaffold(
      appBar: AppBar(title: const Text('List of Messages')),
      backgroundColor: Colors.indigoAccent,
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: numberOfMessages,
        itemBuilder: (BuildContext context, int index){
          Message message = characterProvider.listOfMessages[index];
          return getContainerItem(message);
        }
      ),
      drawer: Drawer(
        backgroundColor: Colors.indigo.shade200,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo.shade400,
              ),
              child: const Text('proyecto 1'),
            ),

            ListTile(
              title:  getTextOnListTile("Agregar"),
              onTap: (() {
                log("Has hecho tap en Agregar");
              }),
            ),

            ListTile(
              title: getTextOnListTile("Integrantes"),
              onTap: (() {
                log("Has hecho tap en Integrantes");
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const MembersScreen()));
              }),
            ),

            ListTile(
              title: getTextOnListTile("Salir"),
              onTap: (() {
                log("Has hecho tap en Salir");
                Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
              }),
            )
          ],
        ),
      ),//const Center(child: Text("Texto de prueba con mensajes")), //Modificar despues para desplegar mensajes
    );
  }
}