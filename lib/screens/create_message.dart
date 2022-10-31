import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto1_curso/models/new_message.dart';
import 'package:proyecto1_curso/providers/api_provider.dart';
import 'package:proyecto1_curso/services/notifications_service.dart';
import '../services/auth_services.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApiProvider message =
        Provider.of<ApiProvider>(context, listen: false);
    final authService = Provider.of<AuthService>(context, listen: false);

    final titleController = TextEditingController();
    final messageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
          title: const Text("New message"), backgroundColor: Colors.indigo),
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: titleController,
                  autofocus: true,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.title),
                    hintText: 'Ingrese titulo',
                    labelText: 'Titulo',
                  ),
                  validator: (value) {
                    if (value == null) return 'Este campo es requerido';

                    if (value.isNotEmpty) return null;
                    return 'Campo obligatorio';
                  },
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: messageController,
                  autocorrect: false,
                  autofocus: false,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.message),
                    hintText: 'Ingrese mensaje',
                    labelText: 'Mensaje',
                  ),
                  validator: (value) {
                    if (value == null) return 'Este campo es requerido';
                    if (value.isNotEmpty) return null;
                    return 'Campo obligatorio';
                  },
                  maxLines: 15,
                ),
                const SizedBox(height: 50),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  color: Colors.deepPurple,
                  onPressed: () async {
                    final String title = titleController.text;
                    final String message = messageController.text;
                    final String user = authService.mail.toString();

                    final String? messageNew =
                        await createMessage(user, title, message);
                    if (messageNew == null) {
                      Navigator.pushReplacementNamed(context, '/home');
                      NotificationsService.showSnackbar('Mensaje creado');
                    } else {
                      NotificationsService.showSnackbar(
                          'Error: Mensaje no creado');
                    }
                    print(messageController.text);
                    print(titleController.text);
                    print(authService.mail.toString());
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                    child: const Text(
                      "Guardar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
