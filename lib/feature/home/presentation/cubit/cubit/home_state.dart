part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetHomeSliderLoading extends HomeState {}
final class GetHomeSliderError extends HomeState {}
final class GetHomeSliderSuccess extends HomeState {

final List<Sliders> sliders;
GetHomeSliderSuccess(this.sliders);

}


final class GetBestSellerError extends HomeState {}
final class GetBestSellerLoading extends HomeState {}
final class GetBestSellerSuccess extends HomeState {

final List<Products> producstList;
GetBestSellerSuccess(this.producstList);
}
