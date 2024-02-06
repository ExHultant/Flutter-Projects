import 'package:flutter/material.dart';
import 'package:to_do_list/utils/button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    Key? key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Añadir Tarea'),
      backgroundColor: Colors.green[300],
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: '¡Nueva Tarea!',
                border: OutlineInputBorder(),
                hintText: "Escribe tu tarea aquí...",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(text: "Añadir", onPressed: onSave),
                const SizedBox(width: 8),
                Button(text: "Cancelar", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
