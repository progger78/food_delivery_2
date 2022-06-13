import 'package:flutter/material.dart';
import 'package:food_delivery_2/utils/app_constants.dart';
import 'package:get/get.dart';
import '../../../routes/route_helper.dart';
import '../../../utils/configurations.dart';
import '/utils/dimensions.dart';
import '/widgets/expandable_text.dart';
import '/widgets/widgets.dart';

class RecommendedDetailBody extends StatelessWidget {
  const RecommendedDetailBody({Key? key, required this.recProduct})
      : super(key: key);
  final dynamic recProduct;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: Dimensions.height70 + 5,
          expandedHeight: Dimensions.height70 * 5,
          backgroundColor: AppColors.yelowColor,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              AppConstants.baseUrl +
                  AppConstants.uploadUrl +
                  recProduct.img,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  size: Dimensions.height25,
                  icon: Icons.clear,
                  press: () {
                    Get.toNamed(RouteHelper.initial);
                  },
                  color: Colors.black,
                ),
                AppIcon(
                     size: Dimensions.height25,
                  icon: Icons.shopping_cart,
                  press: () {},
                )
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(Dimensions.height20),
            child: Container(
              alignment: Alignment.center,
              padding:  EdgeInsets.only(top: Dimensions.height5, bottom: Dimensions.height5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius15),
                      topRight: Radius.circular(Dimensions.radius15))),
              width: double.maxFinite,
              child: AppBigText(
                text: recProduct.name,
                color: Colors.black,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: Dimensions.height25,
                    top: Dimensions.height10),
                child: ExpandableText(text: recProduct.description!),
              )
            ],
          ),
        )
      ],
    );
  }
}
