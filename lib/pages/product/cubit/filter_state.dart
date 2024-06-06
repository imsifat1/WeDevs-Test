part of 'filter_cubit.dart';

abstract class FilterState extends Equatable {
  const FilterState();
  @override
  List<Object> get props => [];
}

class FilterInitial extends FilterState {
  final List<Filter> filterOption;

  FilterInitial({required this.filterOption});

  @override
  List<Object> get props => [filterOption];
}

class FilterProduct extends FilterState {
  final List<Product> productList;

  FilterProduct({required this.productList});

  @override
  List<Object> get props => [productList];
}
