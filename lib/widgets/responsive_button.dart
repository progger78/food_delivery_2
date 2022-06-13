import 'package:flutter/material.dart';
import 'package:food_delivery_2/controllers/popular_product_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '/utils/dimensions.dart';
import '/widgets/widgets.dart';

class ResponsiveButn extends StatelessWidget {
   ResponsiveButn(
      {Key? key,
      this.isCounter = false,
      this.width,
      this.press,
      this.productAmount = 0,
      this.price = 0,
      this.color = Colors.white})
      : super(key: key);

  final bool isCounter;
  double? width;
  final VoidCallback? press;
  final int productAmount;
  final int price;
  final Color color;

 


  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularProductController>(
      builder: (popularProduct) => Container(
        height: Dimensions.height70,
        width: Dimensions.width45 * 3,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(Dimensions.radius20),
        ),
        child: isCounter
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: Dimensions.height25,
                      onPressed: () =>  popularProduct.setProductAmount(false) ,
                      icon:  Icon( Icons.remove) ),
                  FittedBox(
                    child: Text(
                      productAmount.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: Dimensions.font22),
                    ),
                  ),
                  IconButton(
                    iconSize: Dimensions.height25,
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                      onPressed: () => popularProduct.setProductAmount(true),
                      icon: const Icon(Icons.add))
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
                        '\$${price}',
                        style:
                             TextStyle(fontSize: Dimensions.font22, color: Colors.white),
                      ),
                      VerticalDivider(
                        color: Colors.white,
                        thickness: 2,
                        indent: Dimensions.height20,
                        endIndent: Dimensions.height20,
                      ),
                      AppBigText(
                          text: 'Add to cart', size: Dimensions.height25, color: Colors.white),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
