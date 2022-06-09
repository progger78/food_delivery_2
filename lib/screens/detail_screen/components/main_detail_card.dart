import 'package:flutter/material.dart';

import '../../../utils/configurations.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/expandable_text.dart';
import '../../../widgets/widgets.dart';

class MainDetailCard extends StatelessWidget {
  const MainDetailCard({
    Key? key,

    
  }) : super(key: key);

  
  

  @override
  Widget build(BuildContext context) {
    var gottenStars = 4;
    Size size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 0,
      child: Container(
        padding: EdgeInsets.only(
            left: Dimensions.width15,
            top: Dimensions.height25,
            right: Dimensions.width25),
        width: size.width,
        height: size.height * 0.65,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius40),
            topRight: Radius.circular(Dimensions.radius40),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBigText(
              text: 'Dreamy Salmon',
              color: Colors.black,
              size: Dimensions.font30,
            ),
            Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height10, bottom: Dimensions.height20),
              child: Row(
                children: [
                  Wrap(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        color: index < gottenStars
                            ? AppColors.mainColor
                            : Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(width: Dimensions.width5),
                  AppSmallText(
                    text: '(${gottenStars.toStringAsFixed(1)})',
                  ),
                  SizedBox(width: Dimensions.width25),
                  AppSmallText(text: '1245 comments')
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: Dimensions.height25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              ),
            ),
            AppBigText(
              text: 'Introduce',
              color: Colors.black,
            ),
            SizedBox(
              height: Dimensions.height25,
            ),
            const Expanded(
               child: SingleChildScrollView(
                 child: ExpandableText(
                      text:
                          'Popular to serve as a main dish, Salmon provides a tender, flaky-textured meat with a mild to rich flavor, depending on the species. It is a fish that is rich in omega-3 fatty acids, which help to reduce LDL (bad) cholesterol.',
                    ),
               ),
             ),
              
          
          ],
        ),
      ),
    );
  }
}