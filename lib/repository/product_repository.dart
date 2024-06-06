import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart' show rootBundle;
import 'package:wedev_test/model/product.dart';

Future<List<Product>> readJsonFile() async {
  final String response = await rootBundle.loadString('assets/product_response.json');
  final data = await json.decode(response);
  final product = List<Product>.from(data.map((e) => Product.fromJson(e)));

 log('\n----------Login------------\n\n'
     'response:>>>>> $data');

  return product;
}
