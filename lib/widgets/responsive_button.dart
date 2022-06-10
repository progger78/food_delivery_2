import 'package:flutter/material.dart';
import 'package:food_delivery_2/utils/dimensions.dart';
import 'package:food_delivery_2/widgets/widgets.dart';

class ResponsiveButn extends StatelessWidget {
  const ResponsiveButn(
      {Key? key,
      this.isCounter = false,
      this.width = 120,
      required this.press,
      this.productAmount = 0,
      this.price = 0,
      this.color = Colors.white})
      : super(key: key);

  final bool isCounter;
  final double width;
  final VoidCallback press;
  final int productAmount;
  final int price;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height70,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(Dimensions.radius20),
      ),
      child: isCounter
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: press, icon: const Icon(Icons.remove)),
                Text(
                  productAmount.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 26),
                ),
                IconButton(onPressed: press, icon: const Icon(Icons.add))
              ],
            )
          : GestureDetector(
              onTap: press,
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '\$$price',
                      style: const TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    VerticalDivider(
                      color: Colors.white,
                      thickness: 2,
                      indent: Dimensions.height20,
                      endIndent: Dimensions.height20,
                    ),
                    AppBigText(
                        text: 'Add to cart', size: 24, color: Colors.white),
                  ],
                ),
              ),
            ),
    );
  }
}
