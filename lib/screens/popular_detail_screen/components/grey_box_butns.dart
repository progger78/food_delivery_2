import 'package:flutter/material.dart';

import '../../../widgets/grey_box_with_buttns.dart';

class GreyBoxButns extends StatelessWidget {
  const GreyBoxButns({
    Key? key,
    required this.product, this.recProduct,
  }) : super(key: key);

  final dynamic product;
  final dynamic recProduct;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: GreyBoxWithButns(
        product: product,
        recProduct: recProduct
      ),
    );
  }
}
