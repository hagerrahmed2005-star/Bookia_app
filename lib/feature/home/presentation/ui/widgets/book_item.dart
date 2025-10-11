

import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_style.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/feature/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookItem extends StatelessWidget {
  final Products? product;
  final void Function()? onTap;
  const BookItem({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Container(
        padding: EdgeInsets.all(12.r),
        width: 163.w,
        height: 282.h,
        decoration: BoxDecoration(
          color: AppColors.backgroundBook,
          borderRadius: BorderRadius.circular(10.r)
      
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.network(product?.image??"",
              width: 140.w,
              height: 175.h,
              
              ),
            ),
            SizedBox(height: 6.h,),
            Text(product?.name??"",style: AppTextStyle.titleMedium,
            
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product?.price??"",style: AppTextStyle.titleSmall,),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 12.w),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4.r)
                  ),
                  child: Text("Buy",style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white
                  ),),
                )
      
              ],
            )
          ],
        ),
      
      ),
    );
  }
}