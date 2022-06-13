import 'package:flutter/material.dart';
import 'package:food_delivery_2/routes/route_helper.dart';
import 'package:food_delivery_2/utils/app_constants.dart';
import 'package:get/get.dart';

import '/utils/dimensions.dart';
import '/widgets/widgets.dart';

class DetailImageWithIcons extends StatelessWidget {
  const DetailImageWithIcons({
    Key? key, required this.product,
  }) : super(key: key);
  final dynamic product;

  @override
  Widget build(BuildContext context) {
   
    
    
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.45,
      width: size.width,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: [Colors.black, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        image: DecorationImage(
          image: NetworkImage(
              AppConstants.baseUrl+AppConstants.uploadUrl+product.img),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        
        height: 20,
        margin:
            EdgeInsets.symmetric(horizontal: 40, vertical: Dimensions.height45),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppIcon(
                icon: Icons.arrow_back,
                press: () {
                  Get.toNamed(RouteHelper.initial);
                }),
            AppIcon(icon: Icons.shopping_cart, press: () {})
          ],
        ),
      ),
    );
  }
}

