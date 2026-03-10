import 'package:flutter/material.dart';
import 'package:market_app/views/ui/shared_item/card.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(),
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
