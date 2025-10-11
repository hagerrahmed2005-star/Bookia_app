import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/feature/auth/presentation/ui/login/login_screen.dart';
import 'package:bookia_app/feature/cart/presentation/ui/cart_screen.dart';
import 'package:bookia_app/feature/favorit/presentation/ui/favorit_screen.dart';
import 'package:bookia_app/feature/home/presentation/cubit/cubit/home_cubit.dart';
import 'package:bookia_app/feature/home/presentation/ui/home_screen.dart';
import 'package:bookia_app/feature/my_account/presentation/ui/my_account_screen.dart';
import 'package:bookia_app/feature/welcome/presentation/ui/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int currentIdex = 0;
  List<Widget> screens = [
    BlocProvider(create: (context) => HomeCubit()..getHomeSlider()..getBestSeller(), 
    child: HomeScreen()),
    FavoritScreen(),
    CartScreen(),
    MyAccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

        onTap: (index) {
          setState(() {
            currentIdex = index;
          });
        },
        currentIndex: currentIdex,
        selectedItemColor: AppColors.primaryColor,
        backgroundColor: Colors.white,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorit"),
          BottomNavigationBarItem(
            icon: Icon(Icons.crop_rotate_sharp),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "My Account",
          ),
        ],
      ),
      body: screens[currentIdex],
    );
  }
}
