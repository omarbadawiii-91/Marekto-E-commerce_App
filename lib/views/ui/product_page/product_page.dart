import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/core/colors/app_colors.dart';
import 'package:market_app/core/items/alertdialog/dialog.dart';
import 'package:market_app/core/items/image_network/image_network.dart';
import 'package:market_app/core/items/styles/circle_progress_indecator.dart';
import 'package:market_app/core/items/styles/padding.dart';
import 'package:market_app/core/items/styles/style_text.dart';
import 'package:market_app/core/models/product_model/models.dart';
import 'package:market_app/views/manger_data/product_details_cubit/product_cubit_cubit.dart';

// ignore: must_be_immutable
class ProductPage extends StatefulWidget {
  String image;
  String title;
  String price;
  String oldprice;
  ProductModel? product;
  ProductPage({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.oldprice,
    this.product,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool isFavorite = false;
  double rating = 3.5;
  int starCount = 5;
  TextEditingController commentController = TextEditingController();
  @override
  void initState() {
    super.initState();
    context.read<ProductDetails>().getproductdetails(
      widget.product!.productId!,
    );
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
          widget.title,
          style: StyleText.style20.copyWith(
            color: AppColors.kWhiteColor,
            fontSize: 23.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<ProductDetails, ProductDetailsState>(
        listener: (context, state) {
          state is ProductDetailsFailed?
              ShowDialog(
                title: "Error",
                desc: state.message,
                dialogType: DialogType.error,
                btnOkOnPress: () => () {},
              ).showdialog(context)
              : null;
        },
        builder: (context, state) {
          ProductDetails productDetails = context.read<ProductDetails>();
          return state is ProductDetailsLoading?Pad.padcustom(0.h, 0, 0, 0, child:Center(child: CirclProgressIndecator())):
           SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 300.h,
                      width: double.infinity,
                      child: Neworkimagecached(photo: widget.image),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.grey,
                          size: 32,
                        ),
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(16.0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.title,
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Pad.padcustom(
                            10.h,
                            0,
                            0,
                            0,
                            child: Column(
                              children: [
                                Text(
                                  '${widget.price} \$',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                Text(
                                  '${widget.oldprice} \$',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          StarRating(
                            size: 25.sp,
                            rating: rating,
                            color: Colors.orange,
                            borderColor: Colors.grey,
                            allowHalfRating: true,
                            starCount: starCount,
                            onRatingChanged: (rating) => setState(() {
                              this.rating = rating;
                            }),
                          ),
                           SizedBox(width: 8.w),
                           Text(
                            "${productDetails.avaragerate} reviews",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // الوصف
                      const Text(
                        'SmartWatch desc',
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),

                      const SizedBox(height: 24),

                      TextField(
                        controller: commentController,
                        textDirection: TextDirection.ltr,
                        decoration: InputDecoration(
                          hintText: 'Type your Feedback',
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.send,
                              color: AppColors.kPrimaryColor,
                            ),
                            onPressed: () {
                              if (commentController.text.trim().isNotEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Feedback sent: ${commentController.text}',
                                    ),
                                  ),
                                );
                                commentController.clear();
                              }
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                        ),
                      ),

                      const SizedBox(height: 32),

                      // عنوان قسم التعليقات
                      const Text(
                        'Comments',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 12),

                      // حاليًا 0 تعليقات (يمكنك استبدالها بليست لاحقًا)
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 40),
                          child: Text(
                            '0 comments yet.\nBe the first to comment!',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
