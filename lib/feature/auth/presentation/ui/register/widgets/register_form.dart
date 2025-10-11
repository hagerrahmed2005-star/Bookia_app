import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/core/widgets/custom_text_form_field.dart';
import 'package:bookia_app/feature/auth/data/models/register_request_model.dart';
import 'package:bookia_app/feature/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:bookia_app/feature/home/presentation/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();

 bool  isEmailValid(String email){
 bool emailValid = 
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

      return emailValid;
  }


  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    addressController.dispose();
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: 20,
        children: [
          CustomTextFormField(
            controller: nameController,
            hintText: "name",
            validator: (v) {
              if (v == null || v.isEmpty) {
                return "Name is required";
              }
            },
          ),
          CustomTextFormField(
            controller: emailController,
            hintText: "email",
            validator: (v) {
              if (v == null || v.isEmpty) {
                return "Email is required";
              }else if(!isEmailValid(v)){
                return "Enter a valid email";
              }
            },
          ),
          CustomTextFormField(
            controller: passwordController,
            hintText: "password",
            isPassword: true,
            validator: (v) {
              if (v == null || v.isEmpty) {
                return "password is required";
              }else if(v.length<8){
                return "passord must be at least 8 char";
              }
            },
          ),
          CustomTextFormField(
            controller: confirmPassController,
            validator: (v) {
              if (passwordController.text != v) {
                return "confirm password not match";
              }
            },
            hintText: "confirm password",
            isPassword: true,
          ),
          CustomTextFormField(
            controller: addressController,
            hintText: "address",
          ),
          CustomTextFormField(controller: cityController, hintText: "city"),
          SizedBox(height: 10),
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if(state is RegisterLoadingState){
                showDialog(barrierDismissible: false,context: context, builder: (context)=>Center(child: CircularProgressIndicator()));
              }else if(state is RegisterSuccessState){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen()), (e)=>false);
              }else if(state is RegisterErrorState){
                Navigator.pop(context);

                 showDialog(
                      context: context,
                      builder: (context) =>
                          AlertDialog(content: Text(state.errorMessage)),
                    );
              }
            },
            child: CustomButton(
              title: "Register",
              onTap: () {
                if (formKey.currentState?.validate() ?? false) {
                  context.read<AuthCubit>().register(
                    RegisterRequestModel(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      confirmPassword: confirmPassController.text,
                      address: addressController.text,
                      city: cityController.text,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
