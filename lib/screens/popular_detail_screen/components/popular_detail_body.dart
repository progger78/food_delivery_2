import 'package:flutter/material.dart';

import 'detail_image_with_icons.dart';
import 'main_detail_card.dart';

class PopularDetailBody extends StatelessWidget {
  const PopularDetailBody({Key? key, required this.product}) : super(key: key);

  final dynamic product;

  @override
  Widget build(BuildContext context) {

    
    
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          DetailImageWithIcons(product: product),
          MainDetailCard(product: product),
          
        ],
      ),
      
    );
    
  }
}
