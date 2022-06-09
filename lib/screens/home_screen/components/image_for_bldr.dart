import 'package:flutter/material.dart';
import 'package:food_delivery_2/controllers/popular_product_controller.dart';
import 'package:food_delivery_2/utils/configurations.dart';
import '/models/products_model.dart';
import '/utils/app_constants.dart';
import '/utils/dimensions.dart';

import '../../detail_screen/detail_screen.dart';

class ImageForBldr extends StatelessWidget {
  const ImageForBldr({
    Key? key,
    required this.popularProductModel,
    required this.index,
    required this.popularProductCtrl,
  }) : super(key: key);

  final ProductModel popularProductModel;
  final PopularProductController popularProductCtrl;

  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(DetailScreen.routeName);
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
