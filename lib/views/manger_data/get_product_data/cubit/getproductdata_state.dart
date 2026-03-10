part of 'getproductdata_cubit.dart';

@immutable
sealed class GetproductdataState {}

final class GetproductdataInitial extends GetproductdataState {}

final class GetproductdataSuccess extends GetproductdataState {}

final class GetproductdataLoading extends GetproductdataState {}

final class GetproductdataFailed extends GetproductdataState {
  final String message;
  GetproductdataFailed({required this.message});
}
