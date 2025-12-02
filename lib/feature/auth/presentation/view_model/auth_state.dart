part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

 class AuthInitial extends AuthState {}
 class LoadingState extends AuthState {}
 class SuccessState extends AuthState {}
 class ErrorState extends AuthState {
  ErrorState(this.errorMessage);
  final String errorMessage;
}