import 'package:flutter/material.dart';
import 'package:food_delivery_2/utils/dimensions.dart';

import '../../../controllers/popular_product_controller.dart';
import '../../../models/products_model.dart';
import '../../../utils/configurations.dart';
import '../../../widgets/widgets.dart';

class CardForPageBldr extends StatelessWidget {
  CardForPageBldr({
    this.isListViewBldr = false,
    Key? key, required this.popularProductModel, required this.popularProductCtrl,
  }) : super(key: key);

  bool? isListViewBldr;
   final ProductModel popularProductModel;
   final PopularProductController popularProductCtrl;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: Dimensions.width25,
      right: Dimensions.width25,
      bottom: Dimensions.height5,
      child: SizedBox(
        height: Dimensions.pageViewCardHeight,
        width: Dimensions.pageViewCardWidth,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: isListViewBldr!
                ? BorderRadius.only(
                    topRight: Radius.circular(
                      Dimensions.radius15,
                    ),
                    bottomRight: Radius.circular(Dimensions.radius15),
                  )
                : BorderRadius.circular(Dimensions.radius25),
          ),
          color: Colors.white,
          elevation: 3,
          child: Padding(
            padding: EdgeInsets.only(
                top: Dimensions.height15,
                left: Dimensions.width10,
                bottom: Dimensions.height10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBigText(
                  text: popularProductModel.name!,
                  color: Colors.black,
                ),
                Row(
                  children: [
                    Wrap(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          Icons.star_sharp,
                          color: AppColors.mainColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.width5,
                    ),
                    AppSmallText(
                      text: '5.0',
                    ),
                    SizedBox(
                      width: Dimensions.width20,
                    ),
                    AppSmallText(text: '985 comments')
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CardIconText(
                      icon: Icons.circle,
                      color: AppColors.yelowColor,
                      text: 'Normal',
                    ),
                    CardIconText(
                        icon: Icons.location_on,
                        color: AppColors.mainColor,
                        text: '2.0 km'),
                    CardIconText(
                      icon: Icons.watch_later_outlined,
                      color: AppColors.slightPinkIcon,
                      text: '30 min',
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
