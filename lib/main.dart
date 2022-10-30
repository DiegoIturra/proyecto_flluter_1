import 'package:flutter/material.dart';
import 'package:proyecto1_curso/providers/api_provider.dart';
import 'package:provider/provider.dart';
import 'package:proyecto1_curso/providers/login_form_provider.dart';
import 'package:proyecto1_curso/screens/members_screen.dart';
import 'package:proyecto1_curso/services/notifications_service.dart';
import 'package:proyecto1_curso/screens/screens.dart';
import 'package:proyecto1_curso/services/auth_services.dart';

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
      theme: ThemeData(primarySwatch: Colors.indigo),
      initialRoute: '/checking',
      routes: {
        '/home': (context) => const MesssagesScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => const registerScreen(),
        '/checking': (context) => const CheckAuthScreen(),
        '/members': (context) => const MembersScreen()
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
    );
  }
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ApiProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(create: (_) => LoginFormProvider()),
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: const MyApp(),
    );
  }
}
