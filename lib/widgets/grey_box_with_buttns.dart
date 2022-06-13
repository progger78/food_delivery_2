import 'package:flutter/material.dart';
import 'package:food_delivery_2/controllers/cart_controller.dart';
import 'package:food_delivery_2/controllers/popular_product_controller.dart';
import 'package:get/get.dart';

import '../utils/configurations.dart';
import '../utils/dimensions.dart';
import 'widgets.dart';

class GreyBoxWithButns extends StatelessWidget {
  const GreyBoxWithButns({
    Key? key,
    this.isLikeButn = false,
    required this.product,
    this.recProduct,
  }) : super(key: key);
  final dynamic product;
  final dynamic recProduct;

  final bool isLikeButn;
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().initData(product, Get.find<CartController>());
    Size size = MediaQuery.of(context).size;
    return GetBuilder<PopularProductController>(
      builder: (popularProduct) => Container(
        height: size.height * 0.16,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius45),
            topRight: Radius.circular(Dimensions.radius45),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: Dimensions.width25,
            right: Dimensions.width25,
          ),
          child: Row(
            children: [
              isLikeButn
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Dimensions.radius20,
                        ),
                        color: Colors.white,
                      ),
                      height: Dimensions.height70,
                      width: Dimensions.height70,
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.mainColor,
                      ),
                    )
                  : ResponsiveButn(
                      width: Dimensions.width45 * 3.5,
                      isCounter: true,
                      productAmount: popularProduct.inCartItems,
                    ),
              const SizedBox(width: 15),
              Expanded(
                child: ResponsiveButn(
                  price: product.price!,
                  press: () {popularProduct.addItem(product);},
                  color: AppColors.mainColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
