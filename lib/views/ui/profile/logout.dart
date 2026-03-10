import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:market_app/core/items/alertdialog/dialog.dart';
import 'package:market_app/views/manger_data/auth_cubit/authentication_cubit.dart';
import 'package:market_app/views/ui/profile/item/body_profile.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        state is SignoutSuccess ? GoRouter.of(context).go('/signin') : null;
      },
      builder: (context, state) {
        return BodyOfProfile(
          text: "Logout",
          icon: Icons.logout,
          color: Colors.red,
          onTap: () {
            ShowDialog(
              title: "Logout",
              desc: "Are you sure you want to logout",
              dialogType: DialogType.warning,
              btnCancelOnPress: () => () {},
              btnOkOnPress: () {
                context.read<AuthenticationCubit>().sigout();
              },
            ).showdialog(context);
          },
        );
      },
    );
  }
}
