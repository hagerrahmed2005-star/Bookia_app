part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoadingState extends AuthState{}
final class LoginSuccessState extends AuthState{}
final class LoginErrorState extends AuthState{
final String errorMessage;

LoginErrorState(this.errorMessage);
}

final class RegisterSuccessState extends AuthState{}

final class RegisterErrorState extends AuthState{
final String errorMessage;

RegisterErrorState(this.errorMessage);
}

final class RegisterLoadingState extends AuthState{}




