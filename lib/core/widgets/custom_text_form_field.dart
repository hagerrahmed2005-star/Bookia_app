


import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
   final bool isPassword;
   final TextEditingController? controller;
   final String? Function(String?)? validator;
   
  const CustomTextFormField({super.key, required this.hintText,
  this.isPassword=false, this.controller, this.validator
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText=true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:widget.validator,
      controller: widget.controller,
      cursorColor: AppColors.primaryColor,
      obscureText: widget.isPassword&&obscureText,
      decoration: InputDecoration(
        fillColor: AppColors.lighGrayColor,
        filled: true,
        hintText: widget.hintText,
        suffixIcon:widget.isPassword? InkWell(
          onTap: (){
            setState(() {
             obscureText=!obscureText;
            });
          },
          child: Icon(obscureText?Icons.visibility_off_sharp:Icons.visibility_sharp)):null,
        hintStyle: TextStyle(
          fontSize: 15,
          color: AppColors.grayColor
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
      ),

    );
  }
}