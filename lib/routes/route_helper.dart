import '../screens/popular_detail_screen/detail_screen.dart';
import '/screens/home_screen/home_screen.dart';
import '../screens/recommended_detail_screen/recommended_detail_screen.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';

  static String getHomeScreen() => initial;
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId) =>'$recommendedFood?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(
      transition: Transition.fadeIn,
      name: initial,
      page: () {
        return const HomeScreen();
      },
    ),
    GetPage(
      transition: Transition.fadeIn,
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return PopularDetailScreen(
          pageId: int.parse(pageId!),
        );
      },
    ),
    GetPage(
      transition: Transition.fadeIn,
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return RecommendedDetailScreen(
          pageId: int.parse(pageId!),
        );
      },
    )
  ];
}
