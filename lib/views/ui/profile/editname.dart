import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/core/colors/app_colors.dart';
import 'package:market_app/core/items/buttons/custom_button.dart';
import 'package:market_app/core/items/fields/fields.dart';
import 'package:market_app/core/items/styles/style_text.dart';

class Editname extends StatefulWidget {
  final String? currentName; 
  final Function(String)? onSave;

  const Editname({super.key, this.currentName, this.onSave});

  @override
  State<Editname> createState() => _EditnameState();
}

class _EditnameState extends State<Editname> {
  late TextEditingController _nameController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          'Edit Name',
          style: StyleText.style20.copyWith(
            color: AppColors.kWhiteColor,
            fontSize: 25.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
               SizedBox(height: 20.h),
              const Text(
                'New Name',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 15.h),
              Fields(
                hinttext: "Your Name ",
                icon: Icon(Icons.person),
                obscureText: false,
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return'Please enter your name';
                  }
                  if (value.trim().length < 2) {
                    return 'Name must be at least 2 characters';
                  }
                  return null;
                },
              ),

               SizedBox(height: 10.h),
              CustomButton(
                onPressed: (){
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
                },
                text: 'Save Changes',
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
