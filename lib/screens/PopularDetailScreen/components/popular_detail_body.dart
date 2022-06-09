import 'package:flutter/material.dart';
import '../../../utils/configurations.dart';
import '/utils/dimensions.dart';
import '/widgets/expandable_text.dart';
import '/widgets/widgets.dart';

class PoplrDetailBody extends StatelessWidget {
  const PoplrDetailBody({Key? key}) : super(key: key);

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
              'https://p.favim.com/orig/2019/01/28/beautiful-food-yummy-Favim.com-6841439.jpg',
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
          
          title: Padding(
            padding:  EdgeInsets.symmetric(horizontal: Dimensions.width10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.clear,
                  press: () {Navigator.of(context).pop();},
                  color: Colors.black,
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  press: () {},
                )
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              decoration: BoxDecoration(
                 
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius15),
                      topRight: Radius.circular(Dimensions.radius15))),
              width: double.maxFinite,
              child: AppBigText(
                text: 'Crispy and delicious french-fries',
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
                child: const ExpandableText(
                    text:
                        'Popular to serve as a main dish, Salmon provides a tender, flaky-textured meat with a mild to rich flavor, depending on the species. It is a fish that is rich in omega-3 fatty acids, which help to reduce LDL (bad) cholesterolPopular to serve as a main dish, Salmon provides a tender, flaky-textured meat with a mild to rich flavor, depending on the species. It is a fish that is rich in omega-3 fatty acids, which help to reduce LDL (bad) cholesterolPopular to serve as a main dish, Salmon provides a tender, flaky-textured meat with a mild to rich flavor, depending on the species. It is a fish that is rich in omega-3 fatty acids, which help to reduce LDL (bad) cholesterolPopular to serve as a main dish, Salmon provides a tender, flaky-textured meat with a mild to rich flavor, depending on the species. It is a fish that is rich in omega-3 fatty acids, which help to reduce LDL (bad) cholesterolPopular to serve as a main dish, Salmon provides a tender, flaky-textured meat with a mild to rich flavor, depending on the species. It is a fish that is rich in omega-3 fatty acids, which help to reduce LDL (bad) cholesterolPopular to serve as a main dish, Salmon provides a tender, flaky-textured meat with a mild to rich flavor, depending on the species. It is a fish that is rich in omega-3 fatty acids, which help to reduce LDL (bad) cholesterolPopular to serve as a main dish, Salmon provides a tender, flaky-textured meat with a mild to rich flavor, depending on the species. It is a fish that is rich in omega-3 fatty acids, which help to reduce LDL (bad) cholesterolPopular to serve as a main dish, Salmon provides a tender, flaky-textured meat with a mild to rich flavor, depending on the species. It is a fish that is rich in omega-3 fatty acids, which help to reduce LDL (bad) cholesterol'),
              )
            ],
          ),
        )
      ],
    );
  }
}
