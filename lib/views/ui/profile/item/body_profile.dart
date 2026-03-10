import 'package:flutter/material.dart';
import 'package:market_app/core/colors/app_colors.dart';
import 'package:market_app/core/items/styles/style_text.dart';

// ignore: must_be_immutable
class BodyOfProfile extends StatefulWidget {
  String text;
  IconData icon;
  Color? color;
  void Function()? onTap;
  BodyOfProfile({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  State<BodyOfProfile> createState() => _BodyOfProfileState();
}

class _BodyOfProfileState extends State<BodyOfProfile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      selectedColor: AppColors.kPrimaryColor,
      leading: Icon(widget.icon, color: widget.color),
      title: Text(
        widget.text,
        style: StyleText.style20.copyWith(color: widget.color),
      ),
      onTap: widget.onTap,
    );
  }
}
