import 'package:flutter/material.dart';

import 'package:flutter_car_rescue/components/app_bar/custom_app_bar.dart';
import 'package:flutter_car_rescue/components/button/cr_elevated_button.dart';
import 'package:flutter_car_rescue/components/text_field/cr_text_field.dart';
import 'package:flutter_car_rescue/pages/manage_seller/seller/widget/dropdown_menu.dart';
import 'package:flutter_car_rescue/resources/app_color.dart';
import 'package:flutter_svg/svg.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String selectedValue = 'Option 1';

    List<String> options = ['Option 1', 'Option 2', 'Option 3'];
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: const CustomAppBar(title: 'Add Product'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '+ Add Product Images',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: size.width,
                  height: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.bgaddimages),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/add-image-photo-icon.svg',
                        width: 80.0,
                        color: AppColor.white,
                      ),
                      const Text('Images',
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.0)),
                    ],
                  )),
                ),
              ),
              const SizedBox(height: 20.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '+ Product Name',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20.0),
              const CrTextField(
                hintText: 'Product Name',
              ),
              const SizedBox(height: 20.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '+ Category',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              CrDropdownMenu(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '+ Variant list',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20.0),
              const Row(
                children: [
                  Expanded(
                    child: CrTextField(
                      hintText: 'Price',
                      labelText: 'Price',
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: CrTextField(
                      
                      hintText: 'Quantity',
                      labelText: 'Quantity',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              CrElevatedButton(
                onPressed: () {},
                text: 'text',
                color: AppColor.bgaddimages,
                borderColor: AppColor.bgaddimages,
              )
            ],
          ),
        ),
      ),
    );
  }
}
