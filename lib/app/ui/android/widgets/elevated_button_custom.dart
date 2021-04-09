import 'package:flutter/material.dart';

class ElevatedButtomCustom extends StatelessWidget {
  final String text;
  final MaterialStateProperty<Color> backgroundColor;
  final Function onPressed;
  final Color colorText;
  ElevatedButtomCustom(
      {@required this.text,
      this.backgroundColor,
      @required this.onPressed,
      this.colorText = Colors.blueAccent});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: this.onPressed,
      child: Text(
        this.text,
        style: TextStyle(color: this.colorText),
      ),
      style: ButtonStyle(
        backgroundColor: this.backgroundColor,
        elevation: MaterialStateProperty.all<double>(4),
      ),
    );
  }
}
