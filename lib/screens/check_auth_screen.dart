import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto1_curso/screens/screens.dart';
import 'package:proyecto1_curso/services/auth_services.dart';

class CheckAuthScreen extends StatelessWidget {
  const CheckAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authService.readToken(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) return Text('Espere');
            if (snapshot.data == '') {
              Future.microtask(() {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => LoginScreen(),
                      transitionDuration: const Duration(seconds: 0),
                    ));
              });
            } else {
              Future.microtask(() {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const MesssagesScreen(),
                      transitionDuration: const Duration(seconds: 0),
                    ));
              });
            }

            return Container();
          },
        ),
      ),
    );
  }
}
