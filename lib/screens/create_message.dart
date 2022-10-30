
import 'package:flutter/material.dart';

class CreateScreen extends StatelessWidget{
  const CreateScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New message"),
        backgroundColor: Colors.indigo
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          children: const [
            Text("Titulo")
          ],
        ),
      ),
    );
  }

}