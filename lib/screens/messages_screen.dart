import 'package:flutter/material.dart';
import 'package:proyecto1_curso/providers/api_provider.dart';
import 'package:provider/provider.dart';
import 'package:proyecto1_curso/services/auth_services.dart';

class MesssagesScreen extends StatelessWidget {
  const MesssagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApiProvider characterProvider = Provider.of<ApiProvider>(context);
    int numberOfMessages = characterProvider.listOfMessages.length;

    //Para hacer el logout
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: const Text('List of Messages'),
          leading: IconButton(
            icon: const Icon(Icons.login_outlined),
            onPressed: () {
              print(authService.mail);
              authService.logout();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ),
        backgroundColor: Colors.indigoAccent,
        body: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: numberOfMessages,
            itemBuilder: (BuildContext context, int index) {
              String message = characterProvider.listOfMessages[index].text;
              return Container(
                height: 50,
                color: Colors.amber,
                child: Center(child: Text('Entry $message')),
              );
            }) //const Center(child: Text("Texto de prueba con mensajes")), //Modificar despues para desplegar mensajes
        );
  }
}
