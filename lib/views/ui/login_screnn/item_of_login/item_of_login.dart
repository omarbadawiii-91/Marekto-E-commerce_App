import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:market_app/core/items/buttons/button.dart';
import 'package:market_app/core/items/styles/icon.dart';
import 'package:market_app/core/items/fields/fields.dart';
import 'package:market_app/core/items/signin-up_texts/signin-up_texts.dart';
import 'package:market_app/core/items/styles/padding.dart';
import 'package:market_app/core/items/styles/style_text.dart';

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
        Pad.padcustom(20.h, 0, 0, 0, child: SigninUpTexts.title),
        Pad.padcustom(9.h, 0, 0, 0, child: SigninUpTexts.subtitle),
        Pad.padcustom(
          20.h,
          0,
          0,
          0,
          child: Text(
            "Sign in to your Market account",
            style: StyleText.style20.copyWith(fontSize: 20.sp),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Pad.padcustom(30.h, 0, 38.w, 0, child: SigninUpTexts.email),
        ),
        Pad.padcustom(
          20.h,
          0,
          30.w,
          30.w,
          child: Fields(
            hinttext: "Email",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email is required';
              }
              return null;
            },
            icon: Icon(Icons.email_outlined),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Pad.padcustom(10.h, 0, 38.w, 0, child: SigninUpTexts.password),
        ),
        Pad.padcustom(20.h, 0, 30.w, 30.w,
          child: Fields(
            obscureText: isnotvisible,
            hinttext: "password",
            icon: Icon(Icons.visibility),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password is required';
              }
              return null;
            },
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Pad.padcustom(0.h, 0, 0, 30.w,
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
        ),
        Pad.padcustom(80.h, 0, 0, 0,
          child:Button(
            buttontext: "Sign In",
            buttonstyle: StyleText.style16.copyWith(color: Colors.white),
            onpressed: () {
              if (formkey.currentState!.validate()) {
                GoRouter.of(context).go('/controlscreen');
              }
            },
          ),
        ),
        Pad.padcustom(10.h, 0, 0, 0,
          child: Row(
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
          ),
        )
      ],
    );
  }
}
