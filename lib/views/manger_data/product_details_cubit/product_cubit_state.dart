part of 'product_cubit_cubit.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}
final class ProductDetailsSuccess extends ProductDetailsState {}
final class ProductDetailsLoading extends ProductDetailsState {}
final class ProductDetailsFailed extends ProductDetailsState {
  final String message;
  ProductDetailsFailed(this.message);
}