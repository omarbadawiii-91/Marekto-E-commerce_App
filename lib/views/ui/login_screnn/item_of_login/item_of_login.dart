import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:market_app/core/share_items/button.dart';
import 'package:market_app/core/share_items/icon.dart';
import 'package:market_app/core/share_items/items.dart';
import 'package:market_app/core/share_items/style_text.dart';

class item_of_login extends StatelessWidget {
  const item_of_login({
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
          padding: EdgeInsets.only(top: 56.h),
          child: Itemsoflogin.subtitle2,
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
            hinttext: "password",
            icon: Icon(Icons.visibility),
            validatorchek: "Password is required",
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, right: 30),
          child: Align(
            alignment: Alignment.centerRight,
    
            child: InkWell(
              onTap: () {
                GoRouter.of(context).go('/forgetpass');
              },
              child: Text(
                'Forgot password?',
                style: StyleText.style14.copyWith(
                  color: Color(0xff4F39F6),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 50.h),
          child: Button(
            buttontext: "Sign In",
            buttonstyle: StyleText.style16.copyWith(
              color: Colors.white,
            ),
            onpressed: () {
              if (formkey.currentState!.validate()) {
                GoRouter.of(context).go('/controlscreen');
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: StyleText.style16.copyWith(
                  fontWeight: FontWeight.w500,
                ),
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
          ),
        ),
      ],
    );
  }
}
