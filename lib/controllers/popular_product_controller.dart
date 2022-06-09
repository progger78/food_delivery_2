

import '/data/repositories/popular_product_repo.dart';
import '/models/products_model.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  List<dynamic> _popularProductList = [];

  PopularProductController({required this.popularProductRepo});
  List<dynamic> get popularProductList => _popularProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    print('got it man');
    if(response.statusCode == 200){
      _popularProductList = [];
      popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    }
  }
}