import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/core/colors/app_colors.dart';
import 'package:market_app/core/items/styles/circle_progress_indecator.dart';
import 'package:market_app/core/items/styles/padding.dart';
import 'package:market_app/core/items/styles/style_text.dart';
import 'package:market_app/views/manger_data/auth_cubit/authentication_cubit.dart';
import 'package:market_app/views/logic/userdata/userdata.dart';
import 'package:market_app/views/ui/profile/editname.dart';
import 'package:market_app/views/ui/profile/item/body_profile.dart';
import 'package:market_app/views/ui/profile/item/profile_photo.dart';
import 'package:market_app/views/ui/profile/logout.dart';
import 'package:market_app/views/ui/profile/my_orders.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit()..getuserdata(),
      child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {},

        builder: (context, state) {
          Userdatamodle userdatamodle = context
              .read<AuthenticationCubit>()
              .userdatamodle;
          return state is GetuserdataLoading
              ? Pad.padcustom(
                  400.h,
                  0.h,
                  0,
                  0,
                  child: Center(child: CirclProgressIndecator()),
                )
              : Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0.w,
                      vertical: 120.h,
                    ),
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
                            Text(
                              userdatamodle.name ?? "",
                              style: StyleText.style30,
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              userdatamodle.email ?? "",
                              style: StyleText.style20.copyWith(
                                color: const Color.fromARGB(255, 97, 94, 94),
                              ),
                            ),
                            SizedBox(height: 40.h),

                            BodyOfProfile(
                              text: 'Edit Profile',
                              icon: Icons.person,
                              color: AppColors.kBlackColor,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Editname(),
                                  ),
                                );
                              },
                            ),

                            BodyOfProfile(
                              text: 'Change Password',
                              icon: Icons.lock,
                              color: AppColors.kBlackColor,
                              onTap: () {},
                            ),

                            BodyOfProfile(
                              text: "My Orders",
                              icon: Icons.shopping_bag_rounded,
                              color: AppColors.kBlackColor,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyOrders(),
                                  ),
                                );
                              },
                            ),

                            Logout(),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
