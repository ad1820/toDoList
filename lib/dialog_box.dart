import 'package:flutter/material.dart';
import 'package:to_do_list/button.dart';
class DialogBox extends StatelessWidget {
  late final controller;
  late VoidCallback onSave;
  late VoidCallback onCancel;

  DialogBox({required this.controller, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add a new task',
              ),
            ),
            Row(
              children: [
                MyButton(text: 'Save', onPressed: onSave),
                SizedBox(width: 60.0),
                MyButton(text: 'Cancel', onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
