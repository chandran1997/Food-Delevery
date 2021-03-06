import 'package:ecommarce_app/Utilis/colors.dart';
import 'package:ecommarce_app/Utilis/dimensions.dart';
import 'package:ecommarce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';


class ExpandableTextWidgets extends StatefulWidget {
  final String text;
  const ExpandableTextWidgets({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<ExpandableTextWidgets> createState() => _ExpandableTextWidgetsState();
}

class _ExpandableTextWidgetsState extends State<ExpandableTextWidgets> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  bool flag = true;

  double textHeight = Dimensions.screenHeight / 5.8;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > textHeight.toInt()) {
      firstHalf = widget.text
          .substring(0, textHeight.toInt()); //  total 50 line - first 30 line
      secondHalf = widget.text
          .substring(textHeight.toInt() + 1, widget.text.length); //last 20 line
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(
              text: firstHalf,
              height: 1.8,
              size: Dimensions.font16,
              color: AppColors.paraColor,
            )
          : Column(
              children: [
                hiddenText
                    ? Text(
                        firstHalf + "...",
                        style: TextStyle(
                          fontSize: Dimensions.font16,
                          color: AppColors.paraColor,
                          height: 1.8,
                        ),
                      )
                    : Text(
                        firstHalf + secondHalf,
                        style: TextStyle(
                          fontSize: Dimensions.font16,
                          color: AppColors.paraColor,
                          height: 1.8,
                        ),
                      ),
                // hiddenText
                //     ? SmallText(text: firstHalf)
                // : SmallText(text: widget.text),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: "Show more",
                        color: AppColors.maincolor,
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: AppColors.maincolor,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
