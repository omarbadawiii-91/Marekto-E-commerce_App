import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:market_app/core/items/styles/padding.dart';
import 'package:market_app/core/items/styles/style_text.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Pad.padcustom(
        0.h,
        0,
        0,
        30.w,
        child: InkWell(
          onTap: () {
            GoRouter.of(context).go('/forgetpass');
          },
          child: Text(
            "Forget Password",
            style: StyleText.style14.copyWith(
              color: Color(0xff4F39F6),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
