import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wedev_test/model/filter.dart';

import '../../../model/product.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial(filterOption: [
    Filter(title: 'newest', value: false),
    Filter(title: 'oldest', value: false),
    Filter(title: 'price_low_high', value: false),
    Filter(title: 'price_high_low', value: false),
    Filter(title: 'best_selling', value: false),
  ]));

  void onFilter(List<Product> productList, int index) {

    if(index == 0) {
      productList.sort((a, b) => b.dateCreated!.compareTo(a.dateCreated!));
    }
    if(index == 1) {
      productList.sort((a, b) => a.dateCreated!.compareTo(b.dateCreated!));
    }
    if(index == 2) {
      productList.sort((a, b) => a.price!.compareTo(b.price!));
    }
    if(index == 3) {
      productList.sort((a, b) => b.price!.compareTo(a.price!));
    }
    if(index == 4) {
      productList.sort((a, b) => b.totalSales!.compareTo(a.totalSales!));
    }

    emit(FilterProduct(productList: productList));
  }
}
