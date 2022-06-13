import 'package:flutter/material.dart';
import 'package:food_delivery_2/controllers/cart_controller.dart';
import 'package:food_delivery_2/utils/configurations.dart';
import 'package:get/get.dart';

import '/data/repositories/popular_product_repo.dart';
import '/models/products_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  List<dynamic> _popularProductList = [];

  PopularProductController({required this.popularProductRepo});
  List<dynamic> get popularProductList => _popularProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _productAmount = 0;
  int get productAmount => _productAmount;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems+_productAmount;

  late CartController _cart;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    print('got it man');
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    }
  }

  void setProductAmount(bool isIncrement) {
    if (isIncrement) {
      _productAmount = checkProductAmount(_productAmount + 1);
    } else {
      _productAmount = checkProductAmount(_productAmount - 1);
    }

    update();
  }

  int checkProductAmount(int productAmount) {
    if ((_inCartItems + productAmount) < 0) {
      Get.snackbar('Items amount', 'You can\'t reduce more',
          snackStyle: SnackStyle.FLOATING,
          icon: Icon(
            Icons.close,
            color: Colors.white,
          ),
          colorText: Colors.white,
          backgroundColor: AppColors.mainColor);
      return 0;
    } else if ((_inCartItems + productAmount) > 20) {
      Get.snackbar('Items amount', 'You can\'t add more',
          icon: Icon(
            Icons.close,
            color: Colors.white,
          ),
          duration: Duration(seconds: 2),
          colorText: Colors.white,
          backgroundColor: AppColors.mainColor);
      return 20;
    } else {
      return productAmount;
    }
  }

  void initData(ProductModel product, CartController cart) {
    _productAmount = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    if(exist){
      _inCartItems = _cart.getQuantity(product);
    }
  }

  void addItem(ProductModel product) {
    if (_productAmount > 0) {
      _cart.addItem(product, _productAmount);
      _productAmount = 0;
      _inCartItems = _cart.getQuantity(product);
      
    } 
  }
}
