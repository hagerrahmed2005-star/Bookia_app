import 'package:bookia_app/core/helper/local_services.dart';
import 'package:bookia_app/core/theme/app_text_style.dart';
import 'package:bookia_app/feature/book_details/presentation/ui/book_details_screen.dart';
import 'package:bookia_app/feature/home/presentation/cubit/cubit/home_cubit.dart';
import 'package:bookia_app/feature/home/presentation/ui/widgets/book_item.dart';
import 'package:bookia_app/feature/home/presentation/ui/widgets/home_app_bar.dart';
import 'package:bookia_app/feature/home/presentation/ui/widgets/home_slider.dart';
import 'package:bookia_app/feature/welcome/presentation/ui/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            spacing: 10.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeAppBar(),
              HomeSlider(),
              Text("Best Seller", style: AppTextStyle.titleLarge),
              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (prev,current)=>
                  current is GetBestSellerError || current is GetBestSellerLoading
                  || current is GetBestSellerSuccess
                  ,
                  builder: (context, state) {
                    if(state is GetBestSellerLoading){
                      return Center(child: CircularProgressIndicator(),);
                    }else if(state is GetBestSellerSuccess){
                      return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .6,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) => BookItem(
                          product: state.producstList[index],
                          onTap: (){

                              Navigator.push(context, MaterialPageRoute(builder: (context)=>BookDetailsScreen(

                                product: state.producstList[index],
                              )));


                          },

                      ),
                      itemCount: state.producstList.length,
                    );
                    }
                    else{
                      return Text("Error");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
