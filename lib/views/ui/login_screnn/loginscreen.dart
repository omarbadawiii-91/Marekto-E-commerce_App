import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/views/ui/login_screnn/item_of_login/item_of_login.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen>
    with TickerProviderStateMixin {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isnotvisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(top: 60.h),
            child: Form(
              key: formkey,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: item_of_login(isnotvisible: isnotvisible, formkey: formkey),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

