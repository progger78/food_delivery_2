import 'package:flutter/material.dart';
import 'package:food_delivery_2/utils/configurations.dart';
import 'package:food_delivery_2/utils/dimensions.dart';
import 'package:food_delivery_2/widgets/widgets.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText({Key? key, required this.text}) : super(key: key);

  final String text;
  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;
  bool isHiddenText = true;
  double textHeight = Dimensions.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? AppSmallText(text: firstHalf, size: Dimensions.font16, color:  Colors.black.withOpacity(0.7))
          : Column(
              children: [
                AppSmallText(
                  height: 1.5,
                  size: Dimensions.font16,
                  color: Colors.black.withOpacity(0.7),
                  text: isHiddenText
                      ? ('$firstHalf...')
                      : (firstHalf + secondHalf),
                ),
                GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        isHiddenText = !isHiddenText;
                      },
                    );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppSmallText(
                       
                        text: isHiddenText ? 'Show more' : 'Show less',
                        color: AppColors.mainColor,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        child: Icon(
                          isHiddenText ? Icons.expand_more : Icons.expand_less,
                          color: AppColors.mainColor,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
