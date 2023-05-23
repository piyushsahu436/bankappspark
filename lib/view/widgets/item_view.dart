import 'package:app/utils/dimensionScale.dart';
import 'package:app/view/widgets/small_text.dart';
import 'package:flutter/material.dart';

class ItemView extends StatelessWidget {
  final String data1;
  final String data2;
  final String title1;
  final String title2;


  ItemView({ required this.data1, required this.data2, required this.title1, required this.title2});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimension.scaleHeight(10),horizontal: 10),
      height: Dimension.scaleHeight(60),
      width: Dimension.screenWidth-Dimension.scaleWidth(40),
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(Dimension.scaleHeight(16))
      ),
      child: Padding(
        padding:  EdgeInsets.all(Dimension.scaleHeight(10.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            dataItem(title1, data1),
            //SizedBox(height: Dimension.scaleHeight(10),),
            dataItem(title2, data2)
          ],
        ),
      ),
    );

  }
  Widget dataItem(String title,String data){
    return
        SmallText(text: title+': '+data);


  }
}
