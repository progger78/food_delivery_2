import 'package:flutter/material.dart';
import 'package:food_delivery_2/utils/configurations.dart';
import 'package:food_delivery_2/controllers/popular_product_controller.dart';
import 'package:food_delivery_2/screens/PopularDetailScreen/popular_detail_screen.dart';
import 'package:food_delivery_2/screens/detail_screen/detail_screen.dart';
import 'package:get/get.dart';

import 'screens/home_screen/home_screen.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.mainColor,
          secondary: AppColors.yelowColor,
        ),
      ),
      home: const HomeScreen(),
      routes: {
        DetailScreen.routeName: (p0) => const DetailScreen(),
        PopularDetailScreen.routeName: (p0) => const PopularDetailScreen()
      },
    );
  }
}
