import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/views/ui/signup_screen/item/item_signup.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen>
    with TickerProviderStateMixin {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isnotvisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 932.h,
          width: 430.w,
          child: Padding(
            padding: EdgeInsets.only(top: 60.h),
            child: Form(
              key: formkey,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: items_of_signup(isnotvisible: isnotvisible, formkey: formkey),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

