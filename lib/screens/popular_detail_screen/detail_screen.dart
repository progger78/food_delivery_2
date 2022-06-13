import 'package:flutter/material.dart';
import 'package:food_delivery_2/widgets/grey_box_with_buttns.dart';
import 'package:get/get.dart';

import '../../controllers/popular_product_controller.dart';
import 'components/popular_detail_body.dart';

class PopularDetailScreen extends StatelessWidget {
  const PopularDetailScreen({Key? key, required this.pageId}) : super(key: key);
  final int pageId;

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    return Scaffold(
      body: PopularDetailBody(product: product),
      bottomNavigationBar: GreyBoxWithButns(product: product),
    );
  }
}
