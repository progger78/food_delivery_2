import 'package:flutter/material.dart';
import 'package:food_delivery_2/controllers/recommended_product_controller.dart';
import 'package:get/get.dart';
import '/utils/dimensions.dart';
import '/widgets/grey_box_with_buttns.dart';
import '../../utils/configurations.dart';

import '/widgets/widgets.dart';
import 'components/recommended_detail_body.dart';

class RecommendedDetailScreen extends StatelessWidget {
  const RecommendedDetailScreen({Key? key, required this.pageId})
      : super(key: key);
  final int pageId;
  @override
  Widget build(BuildContext context) {
    var recProduct =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];

    return Scaffold(
      backgroundColor: Colors.white,
      body: RecommendedDetailBody(recProduct: recProduct),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width25 * 2,
              right: Dimensions.width25 * 2,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  press: () {},
                  color: Colors.white,
                  backgroundColor: AppColors.mainColor,
                ),
                // ignore: prefer_interpolation_to_compose_strings
                AppBigText(
                  text: '\$${recProduct.price} ' ' X ' ' 0 ',
                  color: Colors.black87,
                  size: Dimensions.font26,
                ),
                AppIcon(
                  icon: Icons.add,
                  press: () {},
                  backgroundColor: AppColors.mainColor,
                  color: Colors.white,
                )
              ],
            ),
          ),
          GreyBoxWithButns(
            isLikeButn: true,
            product: recProduct,
          )
        ],
      ),
    );
  }
}
