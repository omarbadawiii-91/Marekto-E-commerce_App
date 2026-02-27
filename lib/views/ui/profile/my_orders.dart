import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/core/colors/app_colors.dart';
import 'package:market_app/core/items/styles/style_text.dart';
import 'package:market_app/views/ui/shared_item/card.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text('My Orders', style: StyleText.style20.copyWith(color: AppColors.kWhiteColor,fontSize:23.sp),), centerTitle: true,
      ),
      body:ListView.builder(
        itemCount:card.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:  EdgeInsets.only(top: 5.h,left: 20.w,right: 20.w),
            child: Cards(index: index,),
          );
        }
      )
    );
  }
}