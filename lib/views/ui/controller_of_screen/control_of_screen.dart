import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/core/items/nav_bar/nav_bar.dart';
import 'package:market_app/views/logic/navbar/cubit/nav_bar_cubit.dart';
import 'package:market_app/views/ui/store/store.dart';
import 'package:market_app/views/ui/home/homepage.dart';
import 'package:market_app/views/ui/profile/profile.dart';
import 'package:market_app/views/ui/favorite/favorite.dart';

class ControlScreens extends StatefulWidget {
  const ControlScreens({super.key});

  @override
  State<ControlScreens> createState() => _ControlScreensState();
}

class _ControlScreensState extends State<ControlScreens> {
  List<Widget> screens = [
    const HomePage(),
    const StorePage(),
    const FavoritePage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 226, 223, 223),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
          child: Container(
            height: 70.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: NavBar(),
          ),
        ),
        body: BlocBuilder<NavBarCubit, NavBarState>(
          builder: (context, state) {
            NavBarCubit cubit = context.read<NavBarCubit>();
            return Column(children: [screens[cubit.currentindex]]);
          },
        ),
      ),
    );
  }
}
