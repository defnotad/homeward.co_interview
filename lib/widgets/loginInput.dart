import 'package:flutter/material.dart';

class LoginInput extends StatelessWidget {
  final String title;
  final Function onChanged;

  LoginInput(this.title, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: title,
        ),
      ),
    );
  }
}
