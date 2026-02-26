import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/core/colors/app_colors.dart';
import 'package:market_app/core/share_items/custom_button.dart';
import 'package:market_app/core/share_items/style_text.dart';
import 'package:market_app/views/ui/home/items/categories.dart';
import 'package:market_app/views/ui/home/items/item.dart';
import 'package:market_app/views/ui/home/items/itemcard.dart';
import 'package:market_app/views/ui/home/items/shopphoto.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: CustomSearch()),
            SliverToBoxAdapter(child: ShopPhoto()),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 10),
                child: Text(
                  "Categories",
                  style: StyleText.style20.copyWith(fontSize: 25.sp),
                ),
              ),
            ),
            SliverToBoxAdapter(child: Categories()),
           SliverList.builder(itemBuilder: (context, index) => ItemCard(index: index,), itemCount: itemCard.length),
          ],
        ),
      ),
    );
  }
}


