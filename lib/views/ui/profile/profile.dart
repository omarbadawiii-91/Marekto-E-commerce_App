import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:market_app/core/colors/app_colors.dart';
import 'package:market_app/core/items/styles/style_text.dart';
import 'package:market_app/views/ui/profile/editname.dart';
import 'package:market_app/views/ui/profile/item/body_profile.dart';
import 'package:market_app/views/ui/profile/item/profile_photo.dart';
import 'package:market_app/views/ui/profile/my_orders.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 120.h),
        child: SafeArea(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: ProfilePhoto(),
                ),
                SizedBox(height: 16.h),
                 Text('Karim Ahmed', style: StyleText.style30),
                SizedBox(height: 4.h),
                Text(
                  'KarimFlutterDev@gmail.com',
                  style: StyleText.style20.copyWith(
                    color: const Color.fromARGB(255, 97, 94, 94),
                  ),
                ),
                SizedBox(height: 40.h),
                BodyOfProfile(text: 'Edit Profile',  icon:Icons.person , color: AppColors.kBlackColor ,onTap: () { 
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Editname()));
                 },),
                BodyOfProfile(text: 'Change Password',  icon:Icons.lock ,color: AppColors.kBlackColor  ,onTap: () {  },),
                BodyOfProfile(text: "My Orders",  icon: Icons.shopping_bag_rounded, color: AppColors.kBlackColor, onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrders()));
                }),
                BodyOfProfile(text: "Logout", icon: Icons.logout, color: Colors.red, onTap: (){
                  AwesomeDialog(
                      context: context,
                      dialogType: DialogType.warning,
                      animType: AnimType.leftSlide,
                      title: 'Logout',
                      desc: 'Are you sure you want to logout?',
                      btnCancelOnPress: () {
                      },
                      btnOkOnPress: () {
                        GoRouter.of( context).go('/');
                      }).show();
                    
                })
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}



