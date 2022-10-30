import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:proyecto1_curso/providers/login_form_provider.dart';
import 'package:proyecto1_curso/services/auth_services.dart';
import 'package:proyecto1_curso/services/notifications_service.dart';
import 'package:proyecto1_curso/widgets/widgets.dart';
import 'package:proyecto1_curso/UI/input_decorations.dart';

class registerScreen extends StatelessWidget {
  const registerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 250),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text('Crear cuenta',
                        style: Theme.of(context).textTheme.headline4),
                    const SizedBox(height: 10),
                    ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(),
                      child: _LoginForm(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              TextButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/login'),
                child: const Text('Ya tengo una cuenta'),
              ),
              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
        //TODO: mantener referencia al Key
        //autovalidateMode: AutovalidateMode.onUserInteraction,

        key: loginForm.formKey,
        child: Column(
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              autocorrect: false,
              autofocus: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'example@mail.com',
                labelText: 'Correo',
                prefixIcon: Icons.alternate_email_sharp,
              ),
              onChanged: (value) => loginForm.email = value,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El correo no es valido';
              },
            ),
            const SizedBox(height: 30),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              autocorrect: false,
              autofocus: false,
              obscureText: true,
              //keyboardType: TextInputType.,
              decoration: InputDecorations.authInputDecoration(
                hintText: '*******',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outlined,
              ),
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                if (value == null) return 'Este campo es requerido';
                if (value.length >= 6) return null;
                return 'La contraseña debe de tener al menos 6 caracteres';
              },
            ),
            const SizedBox(height: 30),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              color: Colors.deepPurple,
              // ignore: sort_child_properties_last
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text(
                  loginForm.isLoading ? 'Creando cuenta...' : 'Registrar',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              onPressed: loginForm.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();
                      final authService =
                          Provider.of<AuthService>(context, listen: false);

                      if (!loginForm.isValidForm()) return;
                      loginForm.isLoading = true;
                      await Future.delayed(const Duration(seconds: 2));

                      final String? errorMessage = await authService.createUser(
                          loginForm.email, loginForm.password);

                      if (errorMessage == null) {
                        Navigator.pushReplacementNamed(context, '/home');
                      } else {
                        NotificationsService.showSnackbar(
                            'Correo ya registrado');
                        //print(errorMessage);
                        loginForm.isLoading = false;
                      }
                    },
            ),
          ],
        ),
      ),
    );
  }
}
