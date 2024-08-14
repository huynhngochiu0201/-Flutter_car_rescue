import 'package:flutter/material.dart';
import 'package:flutter_car_rescue/gen/assets.gen.dart';
import 'package:flutter_car_rescue/pages/main_page.dart';
import 'package:flutter_car_rescue/resources/app_color.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({
    super.key,
  });

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
          //backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                        builder: (context) => const MainPage(title: '')),
                  );
                },
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 5),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Seller Shop')),
                SizedBox(
                  height: 160,
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.blue,
                            width: 100,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Align(
                    alignment: Alignment.centerLeft, child: Text('Seller Shop'))
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
