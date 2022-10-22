import 'package:flutter/material.dart';

class MesssagesScreen extends StatelessWidget{
  const MesssagesScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('List of Messages')),
      backgroundColor: Colors.indigoAccent,
      body: const Center(child: Text("Texto de prueba con mensajes")), //Modificar despues para desplegar mensajes
    );
  }
}