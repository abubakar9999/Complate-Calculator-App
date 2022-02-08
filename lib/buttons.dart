import 'package:flutter/material.dart';

class Bouttons extends StatelessWidget {
  final color;
  final txtColor;
  final String bouttonText;
  final ontab;
  Bouttons(
      {required this.color,
      required this.txtColor,
      required this.bouttonText,
      required this.ontab});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: ontab,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
              color: color,
              child: Center(
                  child: Text(
                bouttonText,
                style: TextStyle(color: txtColor, fontSize: 20),
              ))),
        ),
      ),
    );
  }
}
