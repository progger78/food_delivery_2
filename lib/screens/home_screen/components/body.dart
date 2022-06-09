import 'package:flutter/material.dart';
import 'package:food_delivery_2/screens/home_screen/components/main_food_page_builder.dart';

import 'header.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Header(),
        Expanded(child: SingleChildScrollView(child: MainFoodPageBody())),
          
    
      ],
    );
  }
}
