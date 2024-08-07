import 'package:flutter/material.dart';
import 'package:flutter_car_rescue/gen/assets.gen.dart';
import 'package:flutter_car_rescue/pages/auth/login_page.dart';
import 'package:flutter_car_rescue/pages/home/home_page.dart';
import 'package:flutter_car_rescue/pages/onboarding/onboarding_page.dart';
import 'package:flutter_car_rescue/resources/app_color.dart';
import 'package:flutter_car_rescue/services/local/shared_prefs.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _initializeSharedPrefs();
  }

  Future<void> _initializeSharedPrefs() async {
    await SharedPrefs.initialise(); // Khởi tạo SharedPrefs

    bool hasSeenOnboarding = SharedPrefs.hasSeenOnboarding;
    String? userUid = SharedPrefs.userUid;

    Future.delayed(const Duration(seconds: 2), () {
      if (userUid != null && userUid.isNotEmpty) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
      } else if (hasSeenOnboarding) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ));
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const OnboardingPage(),
        ));
      }
    });
  }

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
