import 'package:app/controllers/customer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/dimensionScale.dart';
import '../../utils/dummy_data.dart';
import '../widgets/bit_text.dart';
import '../widgets/item_view.dart';
import 'customer_data.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.white],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight)),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: Dimension.scaleHeight(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios))
              ],),

              BigText(text: "All Customers"),
              SizedBox(
                height: Dimension.scaleHeight(20),
              ),
              itemViewBuilder()
            ],
          ),
        ),
      ),
    );
  }
  Widget itemViewBuilder() {
    return Obx(()=>Container(
      height: Dimension.screenHeight - Dimension.scaleHeight(60) -100,
      child: ListView.builder(
          itemCount: CustomersController.customerList.length,
          itemBuilder: (_, index) => InkWell(
            onTap: (){
              Get.to(CustomerDataScreen(CustomersController.customerList[index]));
            },
            child: ItemView(
                data1: CustomersController.customerList[index].name!,
                data2: CustomersController.customerList[index].id!,
                title1: "Name",
                title2: "ID"),
          )),
    ));
  }

}
