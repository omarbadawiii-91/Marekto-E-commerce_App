import 'package:flutter/material.dart';

class ShopPhoto extends StatelessWidget {
  const ShopPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: Image.asset("assets/images/slazzer-edit-image.png"),
      ),
    );
  }
}
