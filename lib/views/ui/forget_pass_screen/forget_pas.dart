import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:market_app/core/items/alertdialog/dialog.dart';
import 'package:market_app/core/items/buttons/button.dart';
import 'package:market_app/core/items/fields/fields.dart';
import 'package:market_app/core/items/styles/circle_progress_indecator.dart';
import 'package:market_app/core/items/styles/icon.dart';
import 'package:market_app/core/items/signin-up_texts/signin-up_texts.dart';
import 'package:market_app/core/items/styles/padding.dart';
import 'package:market_app/core/items/styles/style_text.dart';
import 'package:market_app/views/manger_data/auth_cubit/authentication_cubit.dart';

class Forgetpass extends StatefulWidget {
  const Forgetpass({super.key});

  @override
  State<Forgetpass> createState() => _ForgetpassState();
}

class _ForgetpassState extends State<Forgetpass> with TickerProviderStateMixin {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        state is ResetpasswordSuccess
            ? ShowDialog(
                dialogType: DialogType.success,
                title: "Success",
                desc:
                    "if your email is correct you will receive an email to reset your password",
                btnOkOnPress: () => GoRouter.of(context).go('/signin'),
              ).showdialog(context)
            : null;
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(top: 60.h),
                child: state is ResetpasswordLoading
                    ? Pad.padcustom(
                        0.h,
                        50.h,
                        0,
                        0,
                        child: Center(child: CirclProgressIndecator()),
                      )
                    : Form(
                        key: formkey,
                        child: SingleChildScrollView(
                          physics: NeverScrollableScrollPhysics(),
                          child: Column(
                            children: [
                              Iconphoto.iconimage,
                              Padding(
                                padding: EdgeInsets.only(top: 20.h),
                                child: SigninUpTexts.title,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 9.h),
                                child: SigninUpTexts.subtitle,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 56.h),
                                child: SigninUpTexts.forget,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 60.h,
                                    left: 38.w,
                                  ),
                                  child: SigninUpTexts.email,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 20.h,
                                  left: 30.w,
                                  right: 30.w,
                                ),
                                child: Fields(
                                  controller: emailcontroller,
                                  hinttext: "Email",
                                  icon: Icon(Icons.email_outlined),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter your email";
                                    } else if (value.contains("@") == false) {
                                      return "Email is not valid";
                                    }
                                    return null;
                                  },
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.only(top: 50.h),
                                child: Button(
                                  buttontext: "Reset",
                                  buttonstyle: StyleText.style16.copyWith(
                                    color: Colors.white,
                                  ),
                                  onpressed: () {
                                    if (formkey.currentState!.validate()) {
                                      context
                                          .read<AuthenticationCubit>()
                                          .resetpassword(emailcontroller.text);
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20.h),
                                child: Button(
                                  buttontext: "Back to login",
                                  buttonstyle: StyleText.style16.copyWith(
                                    color: const Color.fromARGB(
                                      255,
                                      255,
                                      255,
                                      255,
                                    ),
                                  ),
                                  onpressed: () {
                                    GoRouter.of(context).go('/signin');
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
