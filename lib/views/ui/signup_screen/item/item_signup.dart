import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:market_app/core/items/buttons/button.dart';
import 'package:market_app/core/items/styles/icon.dart';
import 'package:market_app/core/items/fields/fields.dart';
import 'package:market_app/core/items/signin-up_texts/signin-up_texts.dart';
import 'package:market_app/core/items/styles/padding.dart';
import 'package:market_app/core/items/styles/style_text.dart';

class Itemsofsignup extends StatelessWidget {
  const Itemsofsignup({
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
        Pad.padcustom(22.h, 0, 0, 0, child: SigninUpTexts.signup),
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
            icon: Icon(Icons.email_outlined),
            validator: (value) {
              if (value != null && !value.contains("@")) {
                return "Please enter a valid email";
              }
              return null;
            },
            
            ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Pad.padcustom(10.h, 0, 38.w, 0, child: SigninUpTexts.password),
        ),
        Pad.padcustom(
          20.h,
          0,
          30.w,
          30.w,
          child: Fields(
            hinttext: "Password",
            icon: Icon(Icons.visibility),
            validator: (value) {
              if (value != null && value.length < 6) {
                return "Password must be at least 6 characters";
              }
              return null;
            },
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Pad.padcustom(10.h, 0, 38.w, 0, child: SigninUpTexts.password),
        ),
        Pad.padcustom(
          20.h,
          0,
          30.w,
          30.w,
          child: Fields(
            hinttext: "Confirm Password",
            icon: Icon(Icons.visibility),
            validator: (value) {
              if (value != null && value.length < 6) {
                return "Password must be at least 6 characters";
              }
              return null;
            },
          ),
        ),
    
        Pad.padcustom(30.h, 0, 0, 0, child: Button(
            buttontext: "Sign Up",
            buttonstyle: StyleText.style16.copyWith(
              color: Colors.white,
            ),
            onpressed: () {
              if (formkey.currentState!.validate()) {}
            },
          ),),
        Pad.padcustom(
          20.h,
          0,
          0,
          0,
          child:Row(
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
        )
      ]);
  }
}
