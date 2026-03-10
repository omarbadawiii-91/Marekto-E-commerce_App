import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_app/core/items/styles/style_text.dart';

class Donthaveacc extends StatelessWidget {
  const Donthaveacc({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: StyleText.style16.copyWith(fontWeight: FontWeight.w500),
        ),
        InkWell(
          onTap: () {
            GoRouter.of(context).go('/signup');
          },
          child: Text(
            "Sign Up",
            style: StyleText.style16.copyWith(
              color: Color(0xff4F39F6),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
