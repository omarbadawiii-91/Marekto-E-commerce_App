import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/core/items/styles/circle_progress_indecator.dart';
import 'package:market_app/core/items/styles/padding.dart';
import 'package:market_app/core/items/styles/style_text.dart';
import 'package:market_app/core/models/product_model/models.dart';
import 'package:market_app/views/manger_data/get_product_data/cubit/getproductdata_cubit.dart';
import 'package:market_app/views/ui/home/items/categories.dart';
import 'package:market_app/views/ui/shared_item/custom_search.dart';
import 'package:market_app/views/ui/shared_item/card.dart';
import 'package:market_app/views/ui/shared_item/shopphoto.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<GetproductdataCubit>().getproductdata();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetproductdataCubit, GetproductdataState>(
      builder: (context, state) {
        List<ProductModel> products = context
            .read<GetproductdataCubit>()
            .products;
        return state is GetproductdataLoading
            ? Pad.padcustom(
                445.h,
                0.h,
                0,
                0,
                child: Center(child: CirclProgressIndecator()),
              )
            : Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 80.h),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(child: CustomSearch()),
                      SliverToBoxAdapter(child: ShopPhoto()),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.only(top: 15.h, left: 10.w),
                          child: Text(
                            "Categories",
                            style: StyleText.style20.copyWith(fontSize: 25.sp),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(child: Categories()),
                      SliverList.builder(
                        itemBuilder: (context, index) =>
                            Cards(index: index, product: products[index]),
                        itemCount: products.length,
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
