import 'package:flutter/material.dart';
import 'package:food_delivery_2/utils/dimensions.dart';

import '../../../utils/configurations.dart';
import '../../../widgets/widgets.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.only(
          top: Dimensions.height55,
          left: Dimensions.width25,
          right: Dimensions.width25,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBigText(
                  text: 'Russia',
                  color: AppColors.mainColor,
                ),
                Row(
                  children: [
                    AppSmallText(text: 'St.Petersburg'),
                    const Icon(Icons.arrow_drop_down_rounded)
                  ],
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              width: Dimensions.width45,
              height: Dimensions.height45 ,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(Dimensions.radius15),
              ),
              child: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
