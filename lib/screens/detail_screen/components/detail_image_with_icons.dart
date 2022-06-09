import 'package:flutter/material.dart';

import '/utils/dimensions.dart';
import '/widgets/widgets.dart';

class DetailImageWithIcons extends StatelessWidget {
  const DetailImageWithIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.45,
      width: size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.black, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        image: DecorationImage(
          image: NetworkImage(
              'https://d32ydbgkw6ghe6.cloudfront.net/production/uploads/cover_images/cddaa57b04b0f04f60aa0532929cbf800f24/i1080x475.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        height: 20,
        margin:
            EdgeInsets.symmetric(horizontal: 40, vertical: Dimensions.height45),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppIcon(
                icon: Icons.arrow_back,
                press: () {
                  Navigator.of(context).pop();
                }),
            AppIcon(icon: Icons.shopping_cart, press: () {})
          ],
        ),
      ),
    );
  }
}

