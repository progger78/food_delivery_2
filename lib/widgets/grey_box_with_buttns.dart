import 'package:flutter/material.dart';

import '../utils/configurations.dart';
import '../utils/dimensions.dart';
import 'widgets.dart';

class GreyBoxWithButns extends StatelessWidget {
  const GreyBoxWithButns({
    Key? key,
    this.isLikeButn = false,
  }) : super(key: key);

  final bool isLikeButn;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
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
                    isCounter: true,
                    price: 0,
                    press: () {},
                  ),
            const SizedBox(width: 15),
            Expanded(
              child: ResponsiveButn(
                press: () {},
                color: AppColors.mainColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
