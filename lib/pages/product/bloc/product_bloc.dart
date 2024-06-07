import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/product.dart';
import '../../../repository/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<LoadProduct>((event, emit) async {
      emit(ProductLoading());
      try {
        final data = await readJsonFile();

        emit(ProductLoaded(data));
      } catch (e) {
        emit(const ProductError('Failed to load product data!'));
      }
    });
    
    on<ProductFilterEvent>((event, emit) async {
      List<Product> productList = event.productList;

      emit(ProductLoading());
      
      if(event.index == 0) {
        productList.sort((a, b) => b.dateCreated!.compareTo(a.dateCreated!));
      }
      if(event.index == 1) {
        productList.sort((a, b) => a.dateCreated!.compareTo(b.dateCreated!));
      }
      if(event.index == 2) {
        productList.sort((a, b) => double.parse(a.price!).compareTo(double.parse(b.price!)));
      }
      if(event.index == 3) {
        productList.sort((a, b) => double.parse(b.price!).compareTo(double.parse(a.price!)));
      }
      if(event.index == 4) {
        productList.sort((a, b) => b.totalSales!.compareTo(a.totalSales!));
      }

      emit(ProductLoaded(productList));
    });
  }
}

