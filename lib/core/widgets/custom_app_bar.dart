

import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool withBackButton;
  const CustomAppBar({super.key, this.title, 
  this.withBackButton=true
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppBar(
        backgroundColor: Colors.transparent,
        title: title!=null?Text(title!):null,
        leading:withBackButton? InkWell(
          onTap: (){
            Navigator.pop(context);
          },
        
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.borderColor)
            ),
            child: Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ):null,
      ),
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 56);
}