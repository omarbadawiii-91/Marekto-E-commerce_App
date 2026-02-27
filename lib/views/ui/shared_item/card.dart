import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:market_app/core/colors/app_colors.dart';
import 'package:market_app/core/items/buttons/custom_button.dart';
import 'package:market_app/core/items/image_network/image_network.dart';
import 'package:market_app/core/items/styles/padding.dart';
import 'package:market_app/core/items/styles/style_text.dart';

List<Cards> card = [
  Cards(
    photo:
        'https://i.pinimg.com/736x/00/7b/22/007b22979c8df6f63496daab16f5d06b.jpg',
    title: 'Smart Watch',
    price: '\$250',
    discount: '\$300',
    offer: '20% OFF',
  ),
  Cards(
    photo:
        'https://i.pinimg.com/736x/00/7b/22/007b22979c8df6f63496daab16f5d06b.jpg',
    title: 'Smart Watch',
    price: '\$250',
    discount: '\$300',
    offer: '20% OFF',
  ),
  Cards(
    photo:
        'https://i.pinimg.com/736x/00/7b/22/007b22979c8df6f63496daab16f5d06b.jpg',
    title: 'Smart Watch',
    price: '\$250',
    discount: '\$300',
    offer: '20% OFF',
  ),
];

// ignore: must_be_immutable
class Cards extends StatefulWidget {
  String? photo;
  String? title;
  String? price;
  String? discount;
  String? offer;
  int? index;
  Cards({ super.key, this.photo, this.title, this.price, this.discount, this.offer, this.index,});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
 bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push('/productscreen');
        },
        child: Card(
          color: AppColors.kScaffoldColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 250.h,
                      width: double.infinity,
                      child: Neworkimagecached(index: widget.index,photo: widget.photo,),
                    ),
                    Positioned(
                      child: Container(
                        height: 60.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 79, 57, 246),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            card[widget.index!].offer!,
                            style: StyleText.style20.copyWith(
                              color: AppColors.kScaffoldColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Pad.padcustom(10.h, 0, 15.w, 15.w, child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      card[widget.index!].title!,
                      style: StyleText.style20.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: IconButton(
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
                ),),
               Pad.padcustom(10.h, 15.h, 15.w, 15.w, child: 
             Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          card[widget.index!].price!,
                          style: StyleText.style20.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                        Text(
                          card[widget.index!].discount!,
                          style: StyleText.style20.copyWith(
                            color: const Color.fromARGB(255, 129, 127, 127),
                            fontSize: 18.sp,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                    CustomButton(onPressed: (){},),
                  ],
                ),
          ),
            ],
          ),
        ),
      ),
    );
     
  }
}

