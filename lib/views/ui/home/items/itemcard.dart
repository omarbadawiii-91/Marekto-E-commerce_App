import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_app/core/colors/app_colors.dart';
import 'package:market_app/core/share_items/custom_button.dart';
import 'package:market_app/core/share_items/style_text.dart';

List <ItemCard>itemCard = [
  ItemCard(
                photo: 'https://i.pinimg.com/736x/00/7b/22/007b22979c8df6f63496daab16f5d06b.jpg',
                 title: 'Smart Watch', price: '\$250', discount: '\$300', offer: '20% OFF',),
                 ItemCard(
                photo: 'https://i.pinimg.com/736x/00/7b/22/007b22979c8df6f63496daab16f5d06b.jpg',
                 title: 'Smart Watch', price: '\$250', discount: '\$300', offer: '20% OFF',),
                 ItemCard(
                photo: 'https://i.pinimg.com/736x/00/7b/22/007b22979c8df6f63496daab16f5d06b.jpg',
                 title: 'Smart Watch', price: '\$250', discount: '\$300', offer: '20% OFF',),
];
class ItemCard extends StatelessWidget {
  String? photo;
  String ?title;
  String? price;
  String ?discount;
  String ?offer;
  int ?index;
   ItemCard({
    super.key,
     this.photo,
     this.title,
     this.price,
     this.discount,
     this.offer,
     this.index
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: const EdgeInsets.only(bottom: 40),
     child: 
          Card(
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
                       child: Image.network(
                         itemCard[index!].photo!,
                         fit: BoxFit.cover,
                       ),
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
                             itemCard[index!].offer!,
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
               Padding(
                 padding: EdgeInsetsGeometry.only(
                   top: 15.h,
                   left: 15.w,
                   right: 15.w,
                   bottom: 15.h,
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text(
                       itemCard[index!].title!,
                       style: StyleText.style20.copyWith(
                         fontWeight: FontWeight.bold,
                         fontSize: 20.sp,
                       ),
                     ),
                     IconButton(onPressed: (){}, icon: Icon(
                       Icons.favorite_border,
                       color: AppColors.kGreyColor,
                       weight: 40,
                       size: 30,
                     ),)
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Column(
                       children: [
                         Text(
                           itemCard[index!].price!,
                           style: StyleText.style20.copyWith(
                             fontWeight: FontWeight.bold,
                             fontSize: 20.sp,
                           ),
                         ),
                         Text(
                           itemCard[index!].discount!,
                           style: StyleText.style20.copyWith(
                             color: const Color.fromARGB(
                               255,
                               129,
                               127,
                               127,
                             ),
                             fontSize: 18.sp,
                             decoration: TextDecoration.lineThrough,
                           ),
                         ),
                       ],
                     ),
                     CustomButton(),
                     
                   ],
                 ),
               ),
             ],
           ),
         ),
       );
  }
}
