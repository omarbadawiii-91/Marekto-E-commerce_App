import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/core/colors/app_colors.dart';
import 'package:market_app/core/share_items/style_text.dart';

List<Categories> categories = [
  Categories(icon: Icons.sports, title: "Sports"),
  Categories(icon: Icons.electric_bolt_outlined, title: "Electronics"),
  Categories(icon: Icons.collections, title: "Collections"),
  Categories(icon: Icons.book, title: "Books"),
  Categories(icon: Icons.gamepad, title: "Games"),
];

class Categories extends StatelessWidget {
   IconData ?icon;
  String ?title;
   Categories({
    super.key,
     this.icon,
    this.title
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        height: 150.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    height: 65.h,
                    width: 65.h,
                    child: CircleAvatar(
                      backgroundColor: AppColors.kPrimaryColor,
                      foregroundColor: AppColors.kScaffoldColor,
                      child: Icon(categories[index].icon,size: 35,),
                    ),
                  ),
                  Text(categories[index].title!,style: StyleText.style20.copyWith(fontWeight: FontWeight.bold,fontSize: 16.sp),),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


