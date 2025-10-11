import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/feature/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:bookia_app/feature/auth/presentation/ui/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset("assets/images/welcome.png").image,

          ),
        ),
        child: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 22.0.w),
            child: Column(
              children: [
                SizedBox(height: 135.h),
                Image.asset("assets/images/splash_logo.png"),
                SizedBox(height: 28.h),
                Text(
                  "Order Your Book Now!",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: AppColors.dartColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Spacer(),
                CustomButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => AuthCubit(),
                          child: LoginScreen(),
                        ),
                      ),
                    );
                  },
                  title: "Login",
                ),
                SizedBox(height: 15.h),
                CustomButton(title: "Register", backgroundColor: Colors.white),
                SizedBox(height: 94.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
