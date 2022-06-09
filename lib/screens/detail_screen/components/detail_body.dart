import 'package:flutter/material.dart';

import 'detail_image_with_icons.dart';
import 'gray_box_butns.dart';
import 'main_detail_card.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(
        children: const [
          DetailImageWithIcons(),
          MainDetailCard(),
          GrayBoxButns()
        ],
      ),
    );
  }
}

