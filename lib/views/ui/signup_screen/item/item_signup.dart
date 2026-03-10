import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:market_app/core/items/buttons/button.dart';
import 'package:market_app/core/items/styles/circle_progress_indecator.dart';
import 'package:market_app/core/items/styles/icon.dart';
import 'package:market_app/core/items/fields/fields.dart';
import 'package:market_app/core/items/signin-up_texts/signin-up_texts.dart';
import 'package:market_app/core/items/styles/padding.dart';
import 'package:market_app/core/items/styles/style_text.dart';
import 'package:market_app/views/manger_data/auth_cubit/authentication_cubit.dart';

class Itemsofsignup extends StatefulWidget {
  const Itemsofsignup({super.key});

  @override
  State<Itemsofsignup> createState() => _ItemsofsignupState();
}

class _ItemsofsignupState extends State<Itemsofsignup> {
  bool isnotvisible = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) => {
          state is SignupSuccess ? GoRouter.of(context).go('/signin') : null,
        },
        builder: (context, state) {
          return state is SignupLoading
              ? Pad.padcustom(
                  320.h,
                  0,
                  0,
                  0,
                  child: Center(child: CirclProgressIndecator()),
                )
              : Column(
                  children: [
                    Iconphoto.iconimage,
                    Pad.padcustom(20.h, 0, 0, 0, child: SigninUpTexts.title),
                    Pad.padcustom(9.h, 0, 0, 0, child: SigninUpTexts.subtitle),
                    Pad.padcustom(22.h, 0, 0, 0, child: SigninUpTexts.signup),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Pad.padcustom(
                        30.h,
                        0,
                        38.w,
                        0,
                        child: SigninUpTexts.username,
                      ),
                    ),
                    Pad.padcustom(
                      20.h,
                      0,
                      30.w,
                      30.w,
                      child: Fields(
                        controller: usernamecontroller,
                        hinttext: "Username",
                        icon: Icon(Icons.person),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Please enter a username";
                          } else if (value != null && value.length < 3) {
                            return "Username must be at least 3 characters";
                          } else if (value != null && value.length > 10) {
                            return "Username must be at most 10 characters";
                          } else if (value != null && value.contains(" ")) {
                            return "Username cannot contain spaces";
                          }
                          return null;
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Pad.padcustom(
                        10.h,
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
                      child: Fields(
                        controller: emailcontroller,
                        hinttext: "Email",
                        icon: Icon(Icons.email),
                        validator: (value) {
                          if (value != null && !value.contains("@gmail.com")) {
                            return "Please enter a valid email";
                          } else if (value != null && value.contains(" ")) {
                            return "Email cannot contain spaces";
                          }
                          return null;
                        },
                      ),
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
                      child: Fields(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                          vertical: 4.h,
                        ),
                        controller: passwordcontroller,
                        obscureText: isnotvisible,
                        hinttext: "password",
                        icon: IconButton(
                          icon: isnotvisible
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              isnotvisible = !isnotvisible;
                            });
                          },
                        ),
                        validator: (value) {
                          if (value != null && value.length < 6) {
                            return "Password must be at least 6 characters";
                          } else if (value != null && value.contains(" ")) {
                            return "Password cannot contain spaces";
                          }
                          return null;
                        },
                      ),
                    ),

                    Pad.padcustom(
                      30.h,
                      0,
                      0,
                      0,
                      child: Button(
                        buttontext: "Sign Up",
                        buttonstyle: StyleText.style16.copyWith(
                          color: Colors.white,
                        ),
                        onpressed: () {
                          if (formkey.currentState!.validate()) {
                            context.read<AuthenticationCubit>().signup(
                              usernamecontroller.text,
                              emailcontroller.text,
                              passwordcontroller.text,
                            );
                          }
                        },
                      ),
                    ),
                    Pad.padcustom(
                      20.h,
                      0,
                      0,
                      0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Have an account? ",
                            style: StyleText.style16.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              GoRouter.of(context).go("/signin");
                            },
                            child: Text(
                              "Sign In",
                              style: StyleText.style16.copyWith(
                                color: Color(0xff4F39F6),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
