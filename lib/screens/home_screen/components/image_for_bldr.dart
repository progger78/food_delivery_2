
import 'package:flutter/material.dart';
import 'package:food_delivery_2/routes/route_helper.dart';
import 'package:get/get.dart';
import '/utils/configurations.dart';
import '/models/products_model.dart';
import '/utils/app_constants.dart';
import '/utils/dimensions.dart';


class ImageForBldr extends StatelessWidget {
  const ImageForBldr({
    Key? key,
    required this.popularProductModel,
    required this.index,
  }) : super(key: key);

  final ProductModel popularProductModel;

  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteHelper.getPopularFood(index));
      },
      child: Container(
      
        height: Dimensions.pageViewContainer,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color:
                index.isEven ? AppColors.mainColor : AppColors.yelowColor,
            borderRadius: BorderRadius.circular(Dimensions.radius25),
            image: DecorationImage(
                image: NetworkImage(
                  '${AppConstants.baseUrl}/uploads/${popularProductModel.img!}',
                ),
                fit: BoxFit.cover)),
      ),
    );
  }
}
