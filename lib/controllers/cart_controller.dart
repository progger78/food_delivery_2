import 'package:flutter/material.dart';
import 'package:food_delivery_2/data/repositories/cart_controller_repo.dart';
import 'package:food_delivery_2/models/products_model.dart';
import 'package:get/get.dart';

import '../models/cart_model.dart';
import '../utils/configurations.dart';

class CartController {
  final CartControllerRepo cartControllerRepo;

  CartController({required this.cartControllerRepo});

  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;

  void addItem(ProductModel product, int productAmount) {
    if (_items.containsKey(product.id)) {
      _items.update(
          product.id!,
          (value) => CartModel(
              id: value.id,
              name: value.name,
              price: value.price,
              img: value.img,
              isExist: true,
              quantity: value.quantity! + productAmount,
              time: DateTime.now().toString()));
    } else {
      if (productAmount > 0) {
        _items.putIfAbsent(
          product.id!,
          () => CartModel(
              id: product.id,
              name: product.name,
              price: product.price,
              img: product.img,
              isExist: true,
              quantity: productAmount,
              time: DateTime.now().toString()),
        );
      } else {
        Get.snackbar(
            'Items amount', 'You should add at least 1 item to the cart',
            snackStyle: SnackStyle.FLOATING,
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            colorText: Colors.white,
            backgroundColor: AppColors.mainColor);
      }
    }
  }

  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach(
        (key, value) {
          if (key == product.id) {
            quantity = value.quantity!;
          }
        },
      );
    }
    return quantity;
  }
}
