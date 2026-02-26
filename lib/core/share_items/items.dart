import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/core/share_items/style_text.dart';

class Itemsoflogin{
  static  Text title = Text("Marketo",style: StyleText.style30,);
    static  Text subtitle = Text("Your marketplace for everything",style: StyleText.style16,);
    static  Text subtitle2 = Text("Sign in to your Market account",style: StyleText.style20.copyWith(fontSize: 22),);
        static  Text email = Text("Email",style: StyleText.style16,);
    static Text password = Text("Password",style: StyleText.style16,);
        static Text repassword = Text("Re-Password",style: StyleText.style16,);
        static Text forget = Text("Enter your email to reset your password",style: StyleText.style20.copyWith(fontSize: 20),);


}
// ignore: must_be_immutable
class Fields extends StatefulWidget {
  String? hinttext;
  Widget ? icon;
  String ? validatorchek;
  bool obscureText = false;
  EdgeInsetsGeometry? padding ;
   Fields({super.key,required this.hinttext,required this.icon, this.validatorchek,this.obscureText = false,this.padding});


  @override
  State<Fields> createState() => _FieldsState();
}

class _FieldsState extends State<Fields> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: TextFormField(
        obscureText:widget.obscureText ,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return widget.validatorchek;
          }
          return null;
        },
        decoration: InputDecoration(
        isDense: true,
          contentPadding: widget.padding,
          fillColor:  Color(0xffF3F3F5),
          filled: true,
          suffix: widget.icon, 
          labelText: widget.hinttext,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 92, 90, 90),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: widget.hinttext,
        ),
      
      
      ),
    );
  }
}