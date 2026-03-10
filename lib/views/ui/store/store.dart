import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/core/items/styles/style_text.dart';
import 'package:market_app/views/ui/shared_item/custom_search.dart';
import 'package:market_app/views/ui/shared_item/card.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 22.h),
                child: Center(
                  child: Text(
                    "Welcome to Store",
                    style: StyleText.style20.copyWith(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: CustomSearch()),
            SliverToBoxAdapter(child: Padding(padding: EdgeInsets.all(20))),
            SliverList.builder(
              itemBuilder: (context, index) => Cards(index: index),
              itemCount: card.length,
            ),
          ],
        ),
      ),
    );
  }
}
