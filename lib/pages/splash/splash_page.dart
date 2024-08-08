import 'package:flutter/material.dart';
import 'package:flutter_car_rescue/gen/assets.gen.dart';
import 'package:flutter_car_rescue/resources/app_color.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.white,
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.images.autocarlogo.path))),
      ),
    );
  }
}
