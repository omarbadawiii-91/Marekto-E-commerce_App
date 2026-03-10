import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/core/items/styles/padding.dart';
import 'package:market_app/views/ui/signup_screen/item/item_signup.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 932.h,
          width: 430.w,
          child: Pad.padcustom(
            60.h,
            0,
            0,
            0,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Itemsofsignup(),
            ),
          ),
        ),
      ),
    );
  }
}
