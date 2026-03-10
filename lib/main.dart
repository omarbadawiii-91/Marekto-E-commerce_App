import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/core/keys/sensitive_data.dart';
import 'package:market_app/core/navigation/router_nav.dart';
import 'package:market_app/views/manger_data/auth_cubit/authentication_cubit.dart';
import 'package:market_app/views/manger_data/get_product_data/cubit/getproductdata_cubit.dart';
import 'package:market_app/views/manger_data/product_details_cubit/product_cubit_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: SensitiveData.url,
    anonKey: SensitiveData.apikey,
  );
  runApp(const Market());
}

class Market extends StatelessWidget {
  const Market({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthenticationCubit()),
        BlocProvider(create: (context) => GetproductdataCubit()),
        BlocProvider(create: (context)=>ProductDetails())
      ],
      child: ScreenUtilInit(
        designSize: Size(430, 932),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: RouterNav.router,
        ),
      ),
    );
  }
}
