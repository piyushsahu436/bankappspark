import 'package:app/utils/dimensionScale.dart';
import 'package:app/view/screens/customers_screen.dart';
import 'package:app/view/widgets/bit_text.dart';
import 'package:app/view/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black, Colors.white],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight)),
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    mainImage(),
                    SizedBox(
                      height: Dimension.scaleHeight(30),
                    ),
                    BigText(text: "Welcome to our online bank"),
                    SizedBox(
                      height: Dimension.scaleHeight(150),
                    ),
                    MainButton(title: "View All Customers", event: () {
                     Get.to(CustomersScreen());
                    })
                  ],
                )
              ],
            )));
  }

  Widget mainImage() {
    return SvgPicture.asset(
      "assets/images/Bank.svg",
      height: Dimension.scaleWidth(200),
      width: Dimension.scaleWidth(200),
    );
  }
}
