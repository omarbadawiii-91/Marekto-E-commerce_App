import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Fields extends StatefulWidget {
  String? hinttext;
  Widget? icon;
  bool obscureText = false;
  EdgeInsetsGeometry? padding;
  TextEditingController? controller;
  String? Function(String?)? validator;
  Fields({
    super.key,
    required this.hinttext,
    this.controller,
    required this.icon,
    this.obscureText = false,
    this.padding,
    this.validator,
  });

  @override
  State<Fields> createState() => _FieldsState();
}

class _FieldsState extends State<Fields> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        validator: widget.validator,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: widget.padding,
          fillColor: Color(0xffF3F3F5),
          filled: true,
          suffix: widget.icon,
          labelText: widget.hinttext,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 92, 90, 90),
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          hintText: widget.hinttext,
        ),
      ),
    );
  }
}
