import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:market_app/core/share_items/button.dart';
import 'package:market_app/core/share_items/icon.dart';
import 'package:market_app/core/share_items/items.dart';
import 'package:market_app/core/share_items/style_text.dart';

class items_of_signup extends StatelessWidget {
  const items_of_signup({
    super.key,
    required this.isnotvisible,
    required this.formkey,
  });

  final bool isnotvisible;
  final GlobalKey<FormState> formkey;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          padding: EdgeInsets.only(top: 20.h),
          child: Text(
            "Sign up to your Market account",
            style: StyleText.style20.copyWith(fontSize: 20.sp),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(top: 30.h, left: 38.w),
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
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(top: 5.h, left: 38.w),
            child: Itemsoflogin.password,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 20.h,
            left: 30.w,
            right: 30.w,
          ),
          child: Fields(
            obscureText: isnotvisible,
            hinttext: "Password",
            icon: Icon(Icons.visibility),
    
            validatorchek: "Password is required",
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(top: 5.h, left: 38.w),
            child: Itemsoflogin.repassword,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 20.h,
            left: 30.w,
            right: 30.w,
          ),
          child: Fields(
            obscureText: isnotvisible,
            hinttext: "Password",
            icon: Icon(Icons.visibility),
            validatorchek: "Password is required",
          ),
        ),
    
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Button(
            buttontext: "Sign Up",
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Have an account? ",
                style: StyleText.style16.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              InkWell(
                onTap: () {
                  GoRouter.of(context).go("/signin");
                },
                child: Text(
                  "Sign In",
                  style: StyleText.style16.copyWith(
                    color: Color(0xff4F39F6),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
