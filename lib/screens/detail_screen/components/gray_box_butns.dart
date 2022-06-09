import 'package:flutter/material.dart';

import '../../../widgets/grey_box_with_buttns.dart';

class GrayBoxButns extends StatelessWidget {
  const GrayBoxButns({
    Key? key,

  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
   
    return const Positioned(
      bottom: 0,
      child: GreyBoxWithButns(),
    );
  }
}

