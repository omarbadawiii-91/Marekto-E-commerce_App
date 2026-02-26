import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:market_app/core/share_items/button.dart';
import 'package:market_app/core/share_items/items.dart';
import 'package:market_app/core/share_items/icon.dart';
import 'package:market_app/core/share_items/style_text.dart';

class Forgetpass extends StatefulWidget {
  const Forgetpass({super.key});

  @override
  State<Forgetpass> createState() => _ForgetpassState();
}

class _ForgetpassState extends State<Forgetpass>
    with TickerProviderStateMixin {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(top: 60.h),
            child: Form(
              key: formkey,
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Iconphoto.iconimage,
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Itemsoflogin.title,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 9.h),
                      child: Itemsoflogin.subtitle,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 56.h),
                      child: Itemsoflogin.forget,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 60.h, left: 38.w),
                        child: Itemsoflogin.email,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20.h,
                        left: 30.w,
                        right: 30.w,
                      ),
                      child: Fields(
                        hinttext: "Email",
                        icon: Icon(Icons.email_outlined),
                        validatorchek: "email is required",
                      ),
                    ),
                   
                    Padding(
                      padding: EdgeInsets.only(top: 50.h),
                      child: Button(
                        buttontext: "Reset",
                        buttonstyle: StyleText.style16.copyWith(
                          color: Colors.white,
                        ),
                        onpressed: () {
                          if (formkey.currentState!.validate()) {}
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Button(
                        buttontext: "Back to login",
                        buttonstyle: StyleText.style16.copyWith(
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                        onpressed: () {
                          GoRouter.of(context).go('/signin');
                        },
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
