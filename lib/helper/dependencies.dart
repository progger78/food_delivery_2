import 'package:food_delivery_2/controllers/cart_controller.dart';
import 'package:food_delivery_2/data/repositories/cart_controller_repo.dart';
import 'package:food_delivery_2/utils/app_constants.dart';

import '../controllers/recommended_product_controller.dart';
import '../data/repositories/Recommended_product_repo.dart';
import '/controllers/popular_product_controller.dart';
import '/data/api/api_client.dart';
import '/data/repositories/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl));

  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartControllerRepo());

  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartControllerRepo: Get.find()));
}

// class Person {
//   String? name;
//   int? age;
//   String? city;
//   List<Address>? address;

//   Person(this.name, this.age, this.city, this.address);
//   Person.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     age = json['age'];
//     city = json['city'];
//     if (json['address'] != null) {
//       address = <Address>[];
//       (json['address'] as List).forEach((element) {
//         address!.add(Address.fromJson(element))
//         ;
//       });
//     }
//   }
// }

// class Address {
//   String? country;

//   String? city;

//   Address(this.country, this.city);
//   Address.fromJson(Map<String, dynamic> json) {
//     country = json['country'];

//     city = json['city'];
//   }
// }

// var myMap = {
//   'name': 'Egor',
//   'secondName': 'Pavlov',
//   'age': 23,
//   'address': [
//     {'country': 'Russia', 'city': 'Saint-p'},
//     {'country': 'USA', 'city': 'Moscow'}
//   ]
// };

// class Person2 {
//   String? name;
//   String? secondName;
//   int? age;
//   List<Address2>? address2;

//   Person2(this.address2, this.name, this.secondName, this.age);
//   Person2.fromJson(Map<String, dynamic> json2) {
//     name = json2['name'];
//     secondName = json2['secondName'];
//     age = json2['age'];
//     if (json2['address'] != null) {
//       address2 = <Address2>[];
//       (json2[address2] as List).forEach(
//         (element) {
//           Address.fromJson(element);
//         },
//       );
//     }
//     ;
//   }
// }

// class Address2 {
//   String? country;
//   String? city;
//   Address2(this.city, this.country);

//   Address2.fromJson(Map<String, dynamic> json2) {
//     country = json2['country'];
//     city = json2['city'];
//   }
// }
