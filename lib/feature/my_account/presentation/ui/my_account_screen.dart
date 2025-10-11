import 'package:bookia_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "My Account",withBackButton: false,),
    );
  }
}