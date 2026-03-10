import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:market_app/core/items/alertdialog/dialog.dart';
import 'package:market_app/core/items/buttons/button.dart';
import 'package:market_app/core/items/styles/circle_progress_indecator.dart';
import 'package:market_app/core/items/styles/icon.dart';
import 'package:market_app/core/items/signin-up_texts/signin-up_texts.dart';
import 'package:market_app/core/items/styles/padding.dart';
import 'package:market_app/core/items/styles/style_text.dart';
import 'package:market_app/views/manger_data/auth_cubit/authentication_cubit.dart';
import 'package:market_app/views/ui/login_screnn/item_of_login/dont_have_acc.dart';
import 'package:market_app/views/ui/login_screnn/item_of_login/email_field.dart';
import 'package:market_app/views/ui/login_screnn/item_of_login/forget_pass.dart';
import 'package:market_app/views/ui/login_screnn/item_of_login/pass_field.dart';

class Itemoflogin extends StatefulWidget {
  const Itemoflogin({super.key});

  @override
  State<Itemoflogin> createState() => ItemOfLogin();
}

class ItemOfLogin extends State<Itemoflogin> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isnotvisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        state is SigninSuccess
            ? GoRouter.of(context).go('/controlscreen')
            : null;
        state is SigninFailed
            ? ShowDialog(
                dialogType: DialogType.error,
                btnOkOnPress: () {},
                title: "Error",
                desc: state.errormessage,
              ).showdialog(context)
            : null;
      },
      builder: (context, state) {
        return state is SigninLoading
            ? Pad.padcustom(
                320.h,
                0,
                0,
                0,
                child: Center(child: CirclProgressIndecator()),
              )
            : Form(
                key: formkey,
                child: Column(
                  children: [
                    Iconphoto.iconimage,
                    Pad.padcustom(20.h, 0, 0, 0, child: SigninUpTexts.title),
                    Pad.padcustom(9.h, 0, 0, 0, child: SigninUpTexts.subtitle),
                    Pad.padcustom(
                      20.h,
                      0,
                      0,
                      0,
                      child: Text(
                        "Sign in to your Market account",
                        style: StyleText.style20.copyWith(fontSize: 20.sp),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Pad.padcustom(
                        30.h,
                        0,
                        38.w,
                        0,
                        child: SigninUpTexts.email,
                      ),
                    ),
                    Pad.padcustom(
                      20.h,
                      0,
                      30.w,
                      30.w,
                      child: Emailfield(emailController: emailController),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Pad.padcustom(
                        10.h,
                        0,
                        38.w,
                        0,
                        child: SigninUpTexts.password,
                      ),
                    ),
                    Pad.padcustom(
                      20.h,
                      0,
                      30.w,
                      30.w,
                      child: Passfield(
                        passwordController: passwordController,
                        isnotvisible: isnotvisible,
                      ),
                    ),
                    Forgetpassword(),
                    Pad.padcustom(
                      80.h,
                      0,
                      0,
                      0,
                      child: Button(
                        buttontext: "Sign In",
                        buttonstyle: StyleText.style16.copyWith(
                          color: Colors.white,
                        ),
                        onpressed: () {
                          if (formkey.currentState!.validate()) {
                            context.read<AuthenticationCubit>().signin(
                              emailController.text,
                              passwordController.text,
                            );
                          }
                        },
                      ),
                    ),
                    Pad.padcustom(25.h, 0, 0, 0, child: Donthaveacc()),
                  ],
                ),
              );
      },
    );
  }
}
