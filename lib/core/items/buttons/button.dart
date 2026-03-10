import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  Function()? onpressed;
  String buttontext;
  TextStyle buttonstyle;
  Button({
    super.key,
    required this.buttontext,
    required this.buttonstyle,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        width: 326.w,
        height: 48.h,

        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 0, 0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Text(buttontext, style: buttonstyle)),
      ),
    );
  }
}
