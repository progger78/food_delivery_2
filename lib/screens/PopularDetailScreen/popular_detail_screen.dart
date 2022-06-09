import 'package:flutter/material.dart';
import '/utils/dimensions.dart';
import '/widgets/grey_box_with_buttns.dart';
import '../../utils/configurations.dart';

import '/widgets/widgets.dart';
import 'components/popular_detail_body.dart';

class PopularDetailScreen extends StatelessWidget {
  static const routeName = '/popular-detail-screen';
  const PopularDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const PoplrDetailBody(),
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
                  backgroundColor: AppColors.mainColor,
                ),
                // ignore: prefer_interpolation_to_compose_strings
                AppBigText(text: '\$20.00 ' ' X ' + ' 0 ', color: Colors.black87, size: Dimensions.font26,),
                AppIcon(
                  icon: Icons.add,
                  press: () {},
                  backgroundColor: AppColors.mainColor,
                  color: Colors.white,
                )
              ],
            ),
          ),
          const GreyBoxWithButns(isLikeButn: true)
        ],
      ),
    );
  }
}
