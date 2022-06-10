import 'package:flutter/material.dart';
import 'package:food_delivery_2/routes/route_helper.dart';
import '/utils/configurations.dart';
import '/controllers/popular_product_controller.dart';
import 'package:get/get.dart';

import 'controllers/recommended_product_controller.dart';
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
    Get.find<RecommendedProductController>().getRecommendedProductList();
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
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
