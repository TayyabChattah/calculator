// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final String title;
  final Color color;
  final VoidCallback onpress;

  const MyButton(
      {Key,
      key,
      required this.title,
      this.color = const Color.fromARGB(255, 144, 147, 148),
      required this.onpress})
      : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: InkWell(
          onTap: widget.onpress,
          child: Container(
            height: 55,
            width: 55,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: widget.color),
            child: Center(
              child: Text(
                widget.title,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
