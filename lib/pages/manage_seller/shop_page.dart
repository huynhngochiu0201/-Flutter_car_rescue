import 'package:flutter/material.dart';
import 'package:flutter_car_rescue/gen/assets.gen.dart';
import 'package:flutter_car_rescue/models/explore_model.dart';
import 'package:flutter_car_rescue/models/seller_model.dart';
import 'package:flutter_car_rescue/pages/main_page.dart';
import 'package:flutter_car_rescue/resources/app_color.dart';
import 'package:flutter_svg/svg.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({
    super.key,
    required this.shopModels,
    required this.explore,
  });
  final List<SellerModel> shopModels;
  final List<ExploreModel> explore;

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            primary: true,
            centerTitle: false,
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                Assets.images.chungaotu.path,
                fit: BoxFit.cover,
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const MainPage(title: ''),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Seller Shop',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  height: 160,
                  child: ListView.builder(
                    itemCount: widget.shopModels.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final model = widget.shopModels[index];

                      return GestureDetector(
                        onTap: () {
                          if (model.destination != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => model.destination!));
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Container(
                              alignment: Alignment.center,
                              color: AppColor.grey.withOpacity(0.2),
                              width: 90,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 25.0),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      child:
                                          SvgPicture.asset(model.icons ?? ''),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Text(model.title ?? ''),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Explore Categories',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: widget.explore.length, // Số lượng danh mục
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final explore = widget.explore[index];
                      return GestureDetector(
                        onTap: () {
                          if (explore.destination != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        explore.destination!));
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Container(
                              alignment: Alignment.center,
                              color: AppColor.grey.withOpacity(0.2),
                              width: 160,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 40.0),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      child:
                                          SvgPicture.asset(explore.icons ?? ''),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Text(explore.title ?? ''),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Description',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "In today's fast-paced world, unexpected car troubles can be more than just an inconvenience—they can disrupt your entire day.\nThe 24/7 Car Rescue app is designed to be your reliable partner on the road, offering immediate assistance whenever and wherever you need it. \nWhether you're dealing with a flat tire, a dead battery, or any other roadside emergency, our app connects you with professional rescue teams who are just a tap away. \nWith 24/7 availability, real-time tracking, and a network of trusted service providers, this app ensures that help is always within reach, providing you with peace of mind and keeping you safe on the road. \nDon't let car troubles slow you down—let 24/7 Car Rescue be your lifeline in times of need.",
                    style: TextStyle(fontSize: 16.8),
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
