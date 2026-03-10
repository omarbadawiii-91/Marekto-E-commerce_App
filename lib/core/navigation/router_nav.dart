import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_app/views/ui/forget_pass_screen/forget_pas.dart';
import 'package:market_app/views/ui/controller_of_screen/control_of_screen.dart';
import 'package:market_app/views/ui/login_screnn/loginscreen.dart';
import 'package:market_app/views/ui/product_page/product_page.dart';
import 'package:market_app/views/ui/signup_screen/signup.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RouterNav {
  static final session = Supabase.instance.client.auth.currentSession;
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          if (RouterNav.session != null) {
            return const ControlScreens();
          } else {
            return const Loginscreen();
          }
        },
      ),
      GoRoute(
        path: '/signup',
        builder: (BuildContext context, GoRouterState state) {
          return const Signupscreen();
        },
      ),
      GoRoute(
        path: '/signin',
        builder: (BuildContext context, GoRouterState state) {
          return const Loginscreen();
        },
      ),
      GoRoute(
        path: '/forgetpass',
        builder: (BuildContext context, GoRouterState state) {
          return const Forgetpass();
        },
      ),
      GoRoute(
        path: '/controlscreen',
        builder: (BuildContext context, GoRouterState state) {
          return const ControlScreens();
        },
      ),
    ],
  );
}
