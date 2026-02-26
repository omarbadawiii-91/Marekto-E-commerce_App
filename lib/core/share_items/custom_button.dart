import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/core/colors/app_colors.dart';
import 'package:market_app/core/share_items/style_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: Size(50.w, 50.h),
        backgroundColor: const Color.fromARGB(255, 79, 57, 246),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text("Buy Now", style: StyleText.style20.copyWith(color: Colors.white)),
      );
  }
}
