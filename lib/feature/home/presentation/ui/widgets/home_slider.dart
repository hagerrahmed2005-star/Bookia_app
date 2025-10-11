import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/feature/home/presentation/cubit/cubit/home_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

List<String> images = [
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg",
  "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg",
  "https://plus.unsplash.com/premium_photo-1667912925305-629794bdb691?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1121",
];

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (prev,current)=> current is GetHomeSliderError||
      current is GetHomeSliderLoading || current is GetHomeSliderSuccess
      ,
      builder: (context, state) {
        if(state is GetHomeSliderLoading){
          return Center(child: CircularProgressIndicator(),);
        }else if(state is GetHomeSliderSuccess){

          return  Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 160.0.h,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                onPageChanged: (index, _) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
              items: state.sliders.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Colors.amber,

                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.network(i.image??"").image,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20.h),
            AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: images.length,

              effect: ExpandingDotsEffect(
                activeDotColor: AppColors.primaryColor,
                dotHeight: 10.h,
              ),
            ),
          ],
        );
        }
        else{

          return Text("Error");
        }
      },
    );
  }
}
