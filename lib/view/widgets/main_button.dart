import 'package:app/utils/dimensionScale.dart';
import 'package:app/view/widgets/bit_text.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final event;
  final title;
  MainButton({required this.title, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimension.screenWidth - Dimension.scaleWidth(40),
      height: Dimension.scaleHeight(50),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orangeAccent,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(Dimension.scaleHeight(16)))),
          onPressed: event,
          child: BigText(
            text: title,
          )),
    );
  }
}
