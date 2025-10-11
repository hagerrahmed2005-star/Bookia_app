import 'package:bloc/bloc.dart';
import 'package:bookia_app/feature/home/data/models/product_model.dart';
import 'package:bookia_app/feature/home/data/models/slider_model.dart';
import 'package:bookia_app/feature/home/data/repo/home_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());


  getHomeSlider()async{
    emit(GetHomeSliderLoading());
    final response = await HomeRepo.getHomeSliders();

  if(response is String){
    emit(GetHomeSliderError());
  }else if(response is SliderModel){
    emit(GetHomeSliderSuccess(response.data?.sliders??[]));
  }
  }


  getBestSeller()async{
    emit(GetBestSellerLoading());
    final response=await HomeRepo.getBestSellerBooks();

    if(response is String){
      emit(GetBestSellerError());
    }else if(response is ProductModel){

      emit(GetBestSellerSuccess(response.data?.products??[]));
    }


  }
}
