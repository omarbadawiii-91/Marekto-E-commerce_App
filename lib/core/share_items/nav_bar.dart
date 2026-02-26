import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:market_app/core/colors/app_colors.dart';
import 'package:market_app/views/logic/navbar/cubit/nav_bar_cubit.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          NavBarCubit cubit = context.read<NavBarCubit>();
          return GNav(
            onTabChange: (index) {
              cubit.changeindex(index);
            },
            rippleColor: Color(
              0xff4F39F6,
            ), // tab button ripple color when pressed
            hoverColor: Colors.grey, // tab button hover color
            haptic: true, // haptic feedback
            tabBorderRadius: 15,
            tabActiveBorder: Border.all(
              color: Colors.black,
              width: 1,
            ), // tab button border
            tabBorder: Border.all(
              color: Colors.grey,
              width: 2,
            ), // tab button border
            tabShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8),
            ], // tab button shadow
            curve: Curves.decelerate, // tab animation curves
            duration: Duration(milliseconds: 350), // tab animation duration
            gap: 8, // the tab button gap between icon and text
            color: const Color.fromARGB(
              255,
              85,
              82,
              82,
            ), // unselected icon color
            activeColor: const Color.fromARGB(
              255,
              0,
              0,
              0,
            ), // selected icon and text color
            iconSize: 24, // tab button icon size
            tabBackgroundColor:
                AppColors.kPrimaryColor, // selected tab background color
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
            ), // navigation bar padding
            tabs: [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.favorite, text: 'Likes'),
              GButton(icon: Icons.search, text: 'Search'),
              GButton(icon: Icons.person, text: 'Profile'),
            ],
          );
        },
      ),
    );
  }
}
