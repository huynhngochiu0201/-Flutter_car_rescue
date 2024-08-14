import 'package:flutter/material.dart';

import 'package:flutter_car_rescue/components/app_bar/custom_app_bar.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Add Product'),
      body: Column(
        children: [],
      ),
    );
  }
}
