import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/core/colors/app_colors.dart';

class CirclProgressIndecator extends StatelessWidget {
  const CirclProgressIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 50.h,
      child: const CircularProgressIndicator(
        strokeWidth: 2,
        color: AppColors.kPrimaryColor,
      ),
    );
  }
}
