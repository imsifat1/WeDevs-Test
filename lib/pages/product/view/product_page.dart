import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:wedev_test/barrel/resources.dart';
import 'package:wedev_test/barrel/widgets.dart';
import 'package:wedev_test/localization/app_localization.dart';

import '../../../model/filter.dart';
import '../../../model/product.dart';
import '../cubit/checkbox_cubit.dart';
import '../bloc/product_bloc.dart';

class ProductPage extends StatelessWidget {
  ProductPage({Key? key}) : super(key: key);

  final _filterList = ['newest', 'oldest', 'price_low_high', 'price_high_low', 'best_selling',];
  List<Product> _productList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: AppLocalization.of(context).getTranslatedValue('product_list'),
        backButtonEnabled: false,
        actions: [
          IconButton(onPressed: () => () {}, icon: const Icon(Icons.search, color: Colors.black, size: 22,))
        ],
      ),
      body: BlocProvider(
        create: (context) => ProductBloc()..add(LoadProduct()),
        child: BlocConsumer<ProductBloc, ProductState>(
          listener: (context, state) {
            if(state is ProductLoading) {
            }
            if (state is ProductLoaded) {
              _productList = state.product;
            }
          },
          builder: (context, state) {
            if (state is ProductInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductLoaded) {
              return Column(
                children: [

                  _filterWidget(
                    context,
                    onApply: (int index) {
                      context.read<ProductBloc>().add(ProductFilterEvent(productList: _productList, index: index));
                    },
                  ),

                  const SizedBox(height: 20,),

                  Expanded(
                    child: GridView.count(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 5,
                      childAspectRatio: (1 / 1.6),
                      children: List.generate(_productList.length, (index) => Card(
                        elevation: 2,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          children: [

                            Expanded(
                              flex: 3,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                child: CachedNetworkImage(
                                  imageUrl: _productList[index].images?.first.src ?? '',
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => const Center(child: SizedBox(height: 20, width: 20, child: CircularProgressIndicator())),
                                  errorWidget: (context, url, error) => const Icon(Icons.error, size: 20,),
                                ),
                              ),
                            ),

                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 8,),

                                      Text(_productList[index].name ?? '', maxLines: 2, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,),),

                                      const SizedBox(height: 8,),

                                      RichText(
                                        text: TextSpan(
                                          text: '',
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '${_productList[index].regularPrice ?? 0}\$',
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  decoration: TextDecoration.lineThrough,
                                                  fontSize: 15
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' ${_productList[index].price ?? 0}\$',
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      RatingBar.builder(
                                        initialRating: double.parse(_productList[index].averageRating ?? '0'),
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 15,
                                        itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                                        itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber,),
                                        onRatingUpdate: (rating) {},
                                        ignoreGestures: true,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                    ),
                  ),

                  const SizedBox(height: 100,)
                ],
              );
            } else if (state is ProductError) {
              return Center(child: Text(state.message));
            }

            return Container();
          },
        ),
      ),
    );
  }

  Widget _filterWidget(BuildContext context, {required Function(int) onApply}) {
    final filterOption = [
      Filter(title: 'newest', value: false),
      Filter(title: 'oldest', value: false),
      Filter(title: 'price_low_high', value: false),
      Filter(title: 'price_high_low', value: false),
      Filter(title: 'best_selling', value: false),
    ];

    int? selectedIndex;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 60,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          color: Colors.white,
          child: Row(
            children: [
              TextButton.icon(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height / 1.7,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Center(
                            child: Container(
                              height: 4,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: kPrimaryColor.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(4)
                              ),
                            ),
                          ),

                          const SizedBox(height: 10,),

                          Text(AppLocalization.of(context).getTranslatedValue('filter'), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

                          const SizedBox(height: 5,),

                          Column(
                            children: List.generate(filterOption.length, (index) {
                              return BlocProvider(
                                create: (context) => CheckboxCubit(filterOption.length),
                                child: BlocBuilder<CheckboxCubit, List<bool>>(
                                    builder: (context, state) {
                                      return ListTile(
                                        leading: SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: Checkbox(
                                            activeColor: kPrimaryColor,
                                            side: MaterialStateBorderSide.resolveWith((states) => const BorderSide(width: 2, color: kPrimaryColor)),
                                            value: state[index],
                                            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                                            splashRadius: 0,
                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5)),
                                            onChanged: (bool? value) {
                                              selectedIndex = index;
                                              context.read<CheckboxCubit>().toggleCheckbox(index);
                                            },
                                          ),
                                        ),
                                        title: Text(AppLocalization.of(context).getTranslatedValue(_filterList[index]), style: const TextStyle(fontSize: 15),),
                                        contentPadding: EdgeInsets.zero,
                                        visualDensity: const VisualDensity( vertical: -4),
                                        dense: true,
                                        horizontalTitleGap: 0,
                                        onTap: () {
                                          selectedIndex = index;
                                          context.read<CheckboxCubit>().toggleCheckbox(index);

                                        },
                                      );
                                    }
                                ),
                              );
                            }),
                          ),

                          const SizedBox(height: 30,),

                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {Navigator.pop(context);},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(vertical: 20),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                  ),
                                  child: Text(AppLocalization.of(context).getTranslatedValue('cancel'), style: const TextStyle(fontSize: 17, color: Color(0xFF818995)),),
                                ),
                              ),

                              const SizedBox(width: 20,),

                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    if(selectedIndex != null) {
                                      onApply(selectedIndex!);
                                    }
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF1ABC9C),
                                      padding: const EdgeInsets.symmetric(vertical: 20),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                  ),
                                  child: Text(AppLocalization.of(context).getTranslatedValue('apply'), style: const TextStyle(fontSize: 17, color: Colors.white),),
                                ),
                              )
                            ],
                          )

                        ],
                      ),
                    );
                  },
                );
              },
              icon: const Icon(Icons.tune, size: 20, color: Color(0xFFB6BED4),),
              label: Text(AppLocalization.of(context).getTranslatedValue('filter'), style: const TextStyle(color: Color(0xFF818995), fontSize: 15.5),
              ),
              ),

              const Spacer(),

              Directionality(
                textDirection: TextDirection.rtl,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.expand_more, color: Color(0xFFB6BED4),),
                  label: Text(
                    AppLocalization.of(context).getTranslatedValue('sort_by'),
                    style: const TextStyle(color: Color(0xFF818995), fontSize: 15.5),
                  ),
                ),
              ),

              IconButton(onPressed: () {}, icon: const Icon(Icons.list, color: Color(0xFFB6BED4),))
            ],
          ),
        ),
      ),
    );
  }
}
