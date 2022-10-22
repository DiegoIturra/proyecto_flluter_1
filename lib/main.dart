import 'package:flutter/material.dart';
import 'package:proyecto1_curso/providers/api_provider.dart';
import 'package:provider/provider.dart';
import 'package:proyecto1_curso/screens/messages_screen.dart';


void main() {
  runApp(const AppState());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Proyecto 1",
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      initialRoute: '/home',
      routes: {
        '/home':  (context) => const MesssagesScreen() 
      },
    );
  }
}

class AppState extends StatelessWidget{
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ApiProvider(),lazy: false,),
      ],
      child: const MyApp(),
    );
  }

}
