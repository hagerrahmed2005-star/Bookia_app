import 'package:bookia_app/feature/auth/data/models/register_request_model.dart';
import 'package:bookia_app/feature/auth/data/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());




  login({required String email, required String password})async{
    emit(LoginLoadingState());
    final response= await AuthRepo.login(email: email, password: password);

      if(response is String){
        emit(LoginErrorState(response));
      }else{
        emit(LoginSuccessState());
      }
  }

  register(RegisterRequestModel registerModel)async{
    emit(RegisterLoadingState());
    final response=await AuthRepo.register(registerModel);
    if(response is String){
        emit(RegisterErrorState(response));
      }else{
        emit(RegisterSuccessState());
      }
  }

  
}
