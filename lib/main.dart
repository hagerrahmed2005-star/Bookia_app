

import 'package:bookia_app/bookia.dart';
import 'package:bookia_app/core/helper/dio_services.dart';
import 'package:bookia_app/core/helper/local_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main()async{
  
WidgetsFlutterBinding.ensureInitialized();
 DioServices.init();
 await LocalServices.init();
 await ScreenUtil.ensureScreenSize();
  runApp(Bookia());
}