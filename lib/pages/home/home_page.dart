import 'package:flutter/material.dart';
import 'package:flutter_car_rescue/resources/app_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int pageViewindex = 0;

  @override
  void initState() {
    super.initState(); // Gọi super.initState() trước
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          children: [
            Container(
              height: 50.0,
              padding: const EdgeInsets.all(6.0),
              margin: const EdgeInsets.symmetric(horizontal: 25.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22.0),
                color: const Color(0xFFEBEDEF),
              ),
              child: TabBar(
                dividerColor: Colors.transparent,
                controller: tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(22.0),
                  color: const Color(0XFFFC6011),
                ),
                labelColor: Colors.white,
                tabs: const [
                  Tab(
                    text: 'All Shop',
                  ),
                  Tab(text: 'Map'),
                ],
              ),
            ),
            const Divider(thickness: 5, color: Color(0xFFEBEDEF)),
          ],
        ),
      ),
    );
  }
}
