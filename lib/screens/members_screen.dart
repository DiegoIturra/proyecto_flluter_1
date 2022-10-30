import 'package:flutter/material.dart';

class MembersScreen extends StatelessWidget{
  const MembersScreen({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Members"),
      ),
      backgroundColor: Colors.indigo.shade300,
      body: Center(
        child: Column(
          children: const [
            
            Text("Diego Iturra",
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 40,
                fontWeight: FontWeight.bold 
              ),
            ),

            Text("Vicente Sanhueza",
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 40,
                fontWeight: FontWeight.bold 
              ),
            )
          ],
        ),
      )
    );
  }

}