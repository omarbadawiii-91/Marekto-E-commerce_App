import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/core/items/styles/style_text.dart';

class SigninUpTexts {
  static Text title = Text("Marketo", style: StyleText.style30);
  static Text subtitle = Text(
    "Your marketplace for everything",
    style: StyleText.style16,
  );
  static Text subtitle2 = Text(
    "Sign in to your Market account",
    style: StyleText.style20.copyWith(fontSize: 22.sp),
  );
  static Text email = Text("Email", style: StyleText.style16);
  static Text password = Text("Password", style: StyleText.style16);
  static Text username = Text("Username", style: StyleText.style16);
  static Text forget = Text(
    "Enter your email to reset your password",
    style: StyleText.style20.copyWith(fontSize: 20.sp),
  );
  static Text signup = Text(
    "Sign up to your Market account",
    style: StyleText.style20.copyWith(fontSize: 20.sp),
  );
}
