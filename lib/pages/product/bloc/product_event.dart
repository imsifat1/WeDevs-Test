part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
  @override
  List<Object> get props => [];
}

class LoadProduct extends ProductEvent {}

class ProductFilterEvent extends ProductEvent {
  final List<Product> productList;
  final int index;
  const ProductFilterEvent({required this.productList, required this.index});

  @override
  List<Object> get props => [productList, index];
}
