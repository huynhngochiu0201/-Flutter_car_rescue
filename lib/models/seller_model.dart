import 'package:flutter/material.dart';
import 'package:flutter_car_rescue/pages/manage_seller/seller/add_product_page.dart';
import 'package:flutter_car_rescue/pages/manage_seller/seller/marketing_page.dart';
import 'package:flutter_car_rescue/pages/manage_seller/seller/order_page.dart';
import 'package:flutter_car_rescue/pages/manage_seller/seller/service_page.dart';

class SellerModel {
  String? icons;
  String? title;
  Widget? destination;

  SellerModel();
}

List<SellerModel> shopModel = [
  SellerModel()
    ..icons = 'assets/icons/receipt-us-dollar-icon.svg'
    ..title = 'Order'
    ..destination = const OrderPage(),
  SellerModel()
    ..icons = 'assets/icons/package-add-icon.svg'
    ..title = 'Add Product'
    ..destination = const AddProductPage(),
  SellerModel()
    ..icons = 'assets/icons/services-icon.svg'
    ..title = 'Service'
    ..destination = const ServicePage(),
  SellerModel()
    ..icons = 'assets/icons/affiliate-marketing-icon.svg'
    ..title = 'Marketing'
    ..destination = const MarketingPage(),
];
