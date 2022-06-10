import 'package:flutter/material.dart';
import 'package:food_delivery_2/controllers/popular_product_controller.dart';
import 'package:get/get.dart';

import 'detail_image_with_icons.dart';
import 'grey_box_butns.dart';
import 'main_detail_card.dart';

class PopularDetailBody extends StatelessWidget {
  const PopularDetailBody({Key? key, required this.pageId}) : super(key: key);

  final int pageId;

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          DetailImageWithIcons(product: product),
          MainDetailCard(product: product),
          GreyBoxButns(product: product)
        ],
      ),
    );
  }
}
