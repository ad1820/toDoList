import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  late final String text;
  late VoidCallback onPressed;
  MyButton({
    required this.text,
    required this.onPressed,
});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.grey,
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
