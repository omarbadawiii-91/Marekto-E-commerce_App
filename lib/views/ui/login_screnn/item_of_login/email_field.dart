import 'package:flutter/material.dart';
import 'package:market_app/core/items/fields/fields.dart';

class Emailfield extends StatelessWidget {
  const Emailfield({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Fields(
      controller: emailController,
      hinttext: "Email",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email is required';
        } else if (value.contains("@") == false) {
          return 'Email is not valid';
        }
        return null;
      },
      icon: Icon(Icons.email_outlined),
    );
  }
}
