import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:wedev_test/barrel/resources.dart';
import 'package:wedev_test/barrel/widgets.dart';
import 'package:wedev_test/localization/app_localization.dart';
import 'package:wedev_test/product/bloc/checkbox_cubit.dart';

class ProductPage extends StatelessWidget {
  ProductPage({Key? key}) : super(key: key);

  final _filterList = ['newest', 'oldest', 'price_low_high', 'price_high_low', 'best_selling',];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: AppLocalization.of(context).getTranslatedValue('product_list'),
        backButtonEnabled: false,
        searchBarEnabled: true,
      ),
      body: Column(
        children: [

          _filterWidget(context),

          const SizedBox(height: 20,),

          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 5,
              childAspectRatio: (1 / 1.5),
              children: List.generate(10, (index) => Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [

                      Expanded(
                        flex: 2,
                        child: CachedNetworkImage(
                          imageUrl: "https://img.freepik.com/free-photo/woman-with-shopping-bags-studio-yellow-background-isolated_1303-14286.jpg?w=360",
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(child: SizedBox(height: 20, width: 20, child: const CircularProgressIndicator())),
                          errorWidget: (context, url, error) => const Icon(Icons.error, size: 20,),
                        ),
                      ),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8,),

                            const Text('Girls Stylish Dresses…', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),

                            const SizedBox(height: 8,),

                            RichText(
                              text: const TextSpan(
                                text: '',
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '150\$',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 15
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' 79\$',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 15,
                              itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
            ),
          )
        ],
      ),
    );
  }

  Widget _filterWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 60,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            children: [
              TextButton.icon(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height / 1.7,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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

                          SizedBox(height: 10,),

                          Text(AppLocalization.of(context).getTranslatedValue('filter'), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

                          SizedBox(height: 5,),

                          Column(
                            children: List.generate(_filterList.length, (index) {
                              return BlocProvider(
                                create: (context) => CheckboxCubit(),
                                child: BlocBuilder<CheckboxCubit, bool>(
                                  builder: (context, state) {
                                    return ListTile(
                                      leading: Checkbox(
                                        activeColor: kPrimaryColor,
                                        side: MaterialStateBorderSide.resolveWith((states) => const BorderSide(width: 2, color: kPrimaryColor)),
                                        value: state,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5)),
                                        onChanged: (bool? value) {
                                          context.read<CheckboxCubit>().toggleCheckbox();
                                        },
                                      ),
                                      title: Text(AppLocalization.of(context).getTranslatedValue(_filterList[index])),
                                      contentPadding: EdgeInsets.zero,
                                      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                                      dense: true,
                                      horizontalTitleGap: 0,
                                      onTap: () {
                                        context.read<CheckboxCubit>().toggleCheckbox();
                                      },
                                    );
                                  },
                                ),
                              );
                            }),
                          ),

                          SizedBox(height: 30,),

                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {Navigator.pop(context);},
                                  child: Text(AppLocalization.of(context).getTranslatedValue('cancel'), style: TextStyle(fontSize: 17, color: Color(0xFF818995)),),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(vertical: 20),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                  ),
                                ),
                              ),

                              SizedBox(width: 20,),

                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(AppLocalization.of(context).getTranslatedValue('apply'), style: TextStyle(fontSize: 17,),),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF1ABC9C),
                                      padding: const EdgeInsets.symmetric(vertical: 20),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                  ),
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
