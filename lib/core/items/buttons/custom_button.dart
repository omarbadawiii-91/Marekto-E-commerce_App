import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/core/items/styles/style_text.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const CustomButton({
    super.key,
    required this.onPressed,
    this.text = "Buy Now",
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(50.w, 50.h),
        backgroundColor: const Color.fromARGB(255, 79, 57, 246),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(text, style: StyleText.style20.copyWith(color: Colors.white)),
    );
  }
}
