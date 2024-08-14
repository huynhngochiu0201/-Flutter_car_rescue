import 'package:flutter/material.dart';
import 'package:flutter_car_rescue/components/navigator/app_bottomnavbar1.dart';
import 'package:flutter_car_rescue/components/app_bar/cr_app_bar.dart';
import 'package:flutter_car_rescue/components/cr_zoom_drawer.dart';
import 'package:flutter_car_rescue/pages/home/drawer_page.dart';
import 'package:flutter_car_rescue/pages/home/home_page.dart';
import 'package:flutter_car_rescue/pages/profile/profile_page.dart';
import 'package:flutter_car_rescue/resources/app_color.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
    required this.title,
    this.pageIndex,
  });

  final String title;
  final int? pageIndex;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final zoomDrawerController = ZoomDrawerController();
  late int selectedIndex;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.pageIndex ?? 0;
  }

  toggleDrawer() {
    zoomDrawerController.toggle?.call();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        appBar: CrAppBar(
          leftPressed: toggleDrawer,
          rightPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const ProfilePage(),
          )),
          title: widget.title,
        ),
        body: CrZoomDrawer(
          controller: zoomDrawerController,
          menuScreen: DrawerPage(pageIndex: selectedIndex),
          screen: IndexedStack(
            index: currentIndex,
            children: [
              const HomePage(),
              Container(color: Colors.yellow),
              Container(color: Colors.blue),
              Container(color: Colors.green), // Thay thế bằng CartPage nếu có
              Container(color: Colors.blueGrey),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBarCurvedFb1(
          selected: currentIndex,
          onPressed: (p0) {
            setState(() {
              currentIndex = p0;
            });
          },
        ),
      ),
    );
  }
}
