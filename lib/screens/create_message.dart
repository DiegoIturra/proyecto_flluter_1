
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_services.dart';

class CreateScreen extends StatelessWidget{
  const CreateScreen({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context, listen: false);

    final titleController = TextEditingController();
    final messageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("New message"),
        backgroundColor: Colors.indigo
      ),
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Column(
          children: [

            TextFormField(
              controller: titleController,
              autofocus: true,
              autocorrect: false,
              decoration: const InputDecoration(
                icon: Icon(Icons.title),
                hintText: 'Ingrese titulo',
                labelText: 'titulo',
              ), 
            ),

            TextFormField(
              controller: messageController,
              autocorrect: false,
              autofocus: false,
              decoration: const InputDecoration(
                icon: Icon(Icons.message),
                hintText: 'Ingrese mensaje',
                labelText: 'mensaje',
              ),
              maxLines: 15,
            ),

            const SizedBox(height: 50),

            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              disabledColor: Colors.grey,
              color: Colors.deepPurple,
              onPressed: (() {
                print(messageController.text);
                print(titleController.text);
                print(authService.mail.toString());
              }),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: const Text("Guardar",
                  style: TextStyle(color: Colors.white),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}