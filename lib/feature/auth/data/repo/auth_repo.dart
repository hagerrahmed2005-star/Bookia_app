import 'dart:developer';

import 'package:bookia_app/core/helper/dio_services.dart';
import 'package:bookia_app/core/helper/local_services.dart';
import 'package:bookia_app/feature/auth/data/models/register_request_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  static login({required String email,required String password})async{
   try{
    final response=await DioServices.dio?.post("/login",data: {
      "email":email,
      "password":password
    });

    if(response?.statusCode==200){
        debugPrint(response?.data["data"]["token"]);

     await LocalServices.prefs?.setString("userToken", response?.data["data"]["token"]);
      return response;
    }else{
      log(response?.data["message"]);
     return response?.data["message"];
    }
   }catch(e){
    return "Error try again $e";
   }
  }

 static register(RegisterRequestModel registerModel)async {

try{
  final response= await DioServices.dio?.post("/register",
  data: registerModel.toMap()
  );

if(response?.statusCode==201){
  debugPrint(response?.data["data"]["token"]);
await LocalServices.prefs?.setString("userToken", response?.data["data"]["token"]);
  return response;
}else{
return response?.data["message"];
}
}catch(e){
    return "Error try again $e";
}

}







}

