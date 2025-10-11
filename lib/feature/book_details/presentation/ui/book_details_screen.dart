



import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_style.dart';
import 'package:bookia_app/core/widgets/custom_app_bar.dart';
import 'package:bookia_app/feature/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsScreen extends StatelessWidget {
  final Products? product;
  const BookDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),

      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(product?.image??"",
            width: 183.w,
            height: 271.h,
            ),
            Text(product?.name??"",style: AppTextStyle.titleLarge,),
            Text(product?.category??"",style: AppTextStyle.titleSmall?.copyWith(
              color: AppColors.primaryColor
            ),),
            SizedBox(height: 16.h,),
            Expanded(
              child: Text(product?.description??"",style: TextStyle(
                fontSize: 12.sp
              ),),
            ),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product?.price??"",style: AppTextStyle.titleSmall,),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 14.h,horizontal: 30.w),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4.r)
                  ),
                  child: Text("Add To Cart",style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white
                  ),),
                )
      
              ],
            ),
            SizedBox(height: 50.h,),
        
          ],
        ),
      ),
    );
  }
}