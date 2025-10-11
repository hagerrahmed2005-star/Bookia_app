


import 'package:bookia_app/core/widgets/custom_app_bar.dart';
import 'package:bookia_app/feature/auth/presentation/ui/register/widgets/register_form.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              RegisterForm()
            ],
          ),
        ),
      ),
    );
  }
}