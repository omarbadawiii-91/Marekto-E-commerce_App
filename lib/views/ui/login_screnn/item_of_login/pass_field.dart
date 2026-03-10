import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/core/items/fields/fields.dart';

// ignore: must_be_immutable
class Passfield extends StatefulWidget {
  Passfield({
    super.key,
    required this.passwordController,
    required this.isnotvisible,
  });
  TextEditingController passwordController = TextEditingController();
  bool isnotvisible = false;

  @override
  State<Passfield> createState() => _PassfieldState();
}

class _PassfieldState extends State<Passfield> {
  @override
  Widget build(BuildContext context) {
    return Fields(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
      controller: widget.passwordController,
      obscureText: widget.isnotvisible,
      hinttext: "password",
      icon: IconButton(
        icon: widget.isnotvisible
            ? Icon(Icons.visibility_off)
            : Icon(Icons.visibility),
        onPressed: () {
          setState(() {
            widget.isnotvisible = !widget.isnotvisible;
          });
        },
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        } else if (value.length < 6) {
          return 'Password is not valid';
        }
        return null;
      },
    );
  }
}
