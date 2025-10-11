

import 'package:bookia_app/core/helper/local_services.dart';
import 'package:bookia_app/feature/bottom_nav_bar/presentation/ui/widgets/bottom_nav_bar_screen.dart';
import 'package:bookia_app/feature/home/presentation/ui/home_screen.dart';
import 'package:bookia_app/feature/welcome/presentation/ui/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bookia extends StatelessWidget {
  const Bookia({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      child: MaterialApp(
        home:initalScreen() ,
        theme: ThemeData(
          scaffoldBackgroundColor:     Colors.white,
      
       fontFamily: "DMSerifDisplay"
        ),
      ),
    );
  }




Widget initalScreen(){
  if(LocalServices.prefs?.getString("userToken")==null){
    return WelcomeScreen();
  }else{
    return BottomNavBarScreen();
  }
}

}