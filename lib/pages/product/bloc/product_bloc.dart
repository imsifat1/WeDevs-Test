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
        // final data = List<Product>.from(response.map((e) => Product.fromJson(e)));

        emit(ProductLoaded(data));
      } catch (e) {
        emit(ProductError('Failed to load product data!'));
      }
    });
  }
}

