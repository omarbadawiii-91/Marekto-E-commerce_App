import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/core/navigation/router_nav.dart';


void main() {
  runApp(const Market());
}

class Market extends StatelessWidget {
  const Market({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: RouterNav.router,
      ),
    );
  }
}