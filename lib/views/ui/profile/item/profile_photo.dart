import 'package:flutter/material.dart';
import 'package:market_app/core/colors/app_colors.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: AppColors.kWhiteColor,
      child: const Icon(Icons.person, size: 60, color: AppColors.kPrimaryColor),
    );
  }
}
