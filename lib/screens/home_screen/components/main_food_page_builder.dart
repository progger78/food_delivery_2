import 'package:flutter/material.dart';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:food_delivery_2/routes/route_helper.dart';
import 'package:get/get.dart';
import '/controllers/recommended_product_controller.dart';
import '../../../utils/app_constants.dart';
import '/controllers/popular_product_controller.dart';
import '/models/products_model.dart';
import '/utils/configurations.dart';
import '/utils/dimensions.dart';
import '/widgets/widgets.dart';
import 'card_for_bldr.dart';
import 'image_for_bldr.dart';

class MainFoodPageBody extends StatefulWidget {
  const MainFoodPageBody({Key? key}) : super(key: key);

  @override
  State<MainFoodPageBody> createState() => _MainFoodPageBodyState();
}

class _MainFoodPageBodyState extends State<MainFoodPageBody> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  final double _scaleFactror = 0.8;
  final double _height = 250;
  @override
  void initState() {
    super.initState();
    _pageController.addListener(
      () {
        setState(
          () {
            _currentPageValue = _pageController.page!;
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Column(children: [
      GetBuilder<PopularProductController>(builder: (popularProduct) {
        return Container(
          margin: EdgeInsets.only(top: Dimensions.height20),
          height: Dimensions.basePageViewContainer,
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: popularProduct.popularProductList.length,
            itemBuilder: (context, index) => _buildPageItem(index,
                popularProduct.popularProductList[index], popularProduct),
          ),
        );
      }),
      SizedBox(height: Dimensions.height10),
      GetBuilder<PopularProductController>(
        builder: (popularProduct) => DotsIndicator(
          dotsCount: popularProduct.popularProductList.isEmpty
              ? 1
              : popularProduct.popularProductList.length,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: Size.square(Dimensions.height10 + 1),
            activeSize: Size(Dimensions.width20, Dimensions.height10 + 1),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ),
      SizedBox(height: Dimensions.height25),
      Container(
        margin: EdgeInsets.only(
          left: Dimensions.width25,
          right: Dimensions.width25,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AppBigText(
              text: 'Recommended',
              color: Colors.black,
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 2),
              child: AppSmallText(
                text: '·   Food Pairing',
              ),
            )
          ],
        ),
      ),
      GetBuilder<RecommendedProductController>(
        builder: (recommendedProduct) {
          return recommendedProduct.isLoaded
              ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: recommendedProduct.recommendedProductList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () =>
                          Get.toNamed(RouteHelper.getRecommendedFood(index)),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: Dimensions.width20,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(bottom: Dimensions.height10),
                              height: Dimensions.imageListViewBldr,
                              width: Dimensions.imageListViewBldr,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      '${AppConstants.baseUrl + AppConstants.uploadUrl}${recommendedProduct.recommendedProductList[index].img}',
                                    ),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(
                                  Dimensions.radius15,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: Dimensions.textContainerListBldr,
                                margin: const EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(0, 5),
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 10),
                                  ],
                                  borderRadius: BorderRadius.only(
                                    topRight:
                                        Radius.circular(Dimensions.radius15),
                                    bottomRight:
                                        Radius.circular(Dimensions.radius15),
                                  ),
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: Dimensions.width10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppBigText(
                                        text: recommendedProduct
                                            .recommendedProductList[index].name,
                                        color: Colors.black,
                                      ),
                                      AppSmallText(
                                          text:
                                              'With elegance of classic recipies'),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
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
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        },
      ),
    ]);
  }

  Widget _buildPageItem(int index, ProductModel popularProductModel,
      PopularProductController popularProductCtrl) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactror);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactror + (_currentPageValue - index + 1) * (1 - _scaleFactror);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactror);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - currScale) / 2, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          ImageForBldr(
            popularProductModel: popularProductModel,
            index: index,
          ),
          CardForPageBldr(
              index: index,
              popularProductModel: popularProductModel,
              )
        ],
      ),
    );
  }
}
