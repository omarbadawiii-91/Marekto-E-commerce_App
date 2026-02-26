import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/core/share_items/nav_bar.dart';
import 'package:market_app/views/logic/navbar/cubit/nav_bar_cubit.dart';
import 'package:market_app/views/ui/favorite/favorite.dart';
import 'package:market_app/views/ui/home/homepage.dart';
import 'package:market_app/views/ui/person/person.dart';
import 'package:market_app/views/ui/search/search.dart';

class ControlScreens extends StatefulWidget {
  const ControlScreens({super.key});

  @override
  State<ControlScreens> createState() => _ControlScreensState();
}

class _ControlScreensState extends State<ControlScreens> {
  List<Widget> screens = [
    const HomePage(),
    const FavoritePage(),
    const SearchPage(),
    const PersonPage(),
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
