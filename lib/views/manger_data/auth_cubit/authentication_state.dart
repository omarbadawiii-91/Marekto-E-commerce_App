part of 'authentication_cubit.dart';

@immutable
sealed class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

final class SignupLoading extends AuthenticationState {}

final class SignupSuccess extends AuthenticationState {}

// ignore: must_be_immutable
final class SignupFailed extends AuthenticationState {
  String errormessage;
  SignupFailed({required this.errormessage});
}

final class SigninLoading extends AuthenticationState {}

final class SigninSuccess extends AuthenticationState {}

// ignore: must_be_immutable
final class SigninFailed extends AuthenticationState {
  String errormessage;
  SigninFailed({required this.errormessage});
}

final class SignoutLoading extends AuthenticationState {}

final class SignoutSuccess extends AuthenticationState {}

final class SignoutFailed extends AuthenticationState {}

final class ResetpasswordLoading extends AuthenticationState {}

final class ResetpasswordSuccess extends AuthenticationState {}

final class ResetpasswordFailed extends AuthenticationState {}

final class InsertdatabaseLoading extends AuthenticationState {}

final class InsertdatabaseSuccess extends AuthenticationState {}

final class InsertdatabaseFailed extends AuthenticationState {}

final class GetuserdataLoading extends AuthenticationState {}

final class GetuserdataSuccess extends AuthenticationState {}

final class GetuserdataFailed extends AuthenticationState {}
