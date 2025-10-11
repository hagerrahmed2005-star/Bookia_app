import 'package:bookia_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class FavoritScreen extends StatelessWidget {
  const FavoritScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Favorit",withBackButton: false,),
    );
  }
}