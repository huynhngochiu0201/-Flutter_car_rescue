import 'package:flutter/material.dart';
import 'package:flutter_car_rescue/pages/manage_seller/seller/add_product_page.dart';
import 'package:flutter_car_rescue/pages/manage_seller/seller/order_page.dart';
import 'package:flutter_car_rescue/pages/manage_seller/seller/service_page.dart';

class ExploreModel {
  String? icons;
  String? title;
  Widget? destination;

  ExploreModel();
}

List<ExploreModel> explores = [
  ExploreModel()
    ..icons = 'assets/icons/add-video.svg'
    ..title = 'Add Video'
    ..destination = const OrderPage(),
  ExploreModel()
    ..icons = 'assets/icons/package-add-icon.svg'
    ..title = 'Introducing\nThe Store'
    ..destination = const AddProductPage(),
  ExploreModel()
    ..icons = 'assets/icons/services-icon.svg'
    ..title = 'Service'
    ..destination = const ServicePage(),
];
