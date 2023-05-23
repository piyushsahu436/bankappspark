import 'package:app/view/widgets/bit_text.dart';
import 'package:app/view/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../controllers/transfer_controller.dart';
import '../../model/transfer_model.dart';
import '../../utils/dimensionScale.dart';

class TransferHistoryScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Colors.orangeAccent, Colors.white])),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: Dimension.scaleHeight(20),
              ),
              BigText(text: "Transfers History"),
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
    return Obx(()=> Container(
      height: Dimension.screenHeight - Dimension.scaleHeight(59) - 100,
      child: ListView.builder(
          itemCount: TransferController.transferList.length,
          itemBuilder: (_, index) => itemView(TransferController.transferList[index])
      ),
    ));

  }
  Widget itemView(Transfer transfer)
  {
    return Container(
      margin: EdgeInsets.symmetric(vertical:Dimension.scaleHeight(10)),
      padding: EdgeInsets.all(Dimension.scaleHeight(10)),

      height: Dimension.scaleHeight(200),
      width: Dimension.screenWidth-Dimension.scaleWidth(40),
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SmallText(text: "Sender",size: Dimension.scaleHeight(16),)
          ],),
          SmallText(text: "Name: ${transfer.sender}"),
          SmallText(text: "ID: ${transfer.ids}"),
          SizedBox(height: Dimension.scaleHeight(8),),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmallText(text: "Reciever",size: Dimension.scaleHeight(16),)
            ],),
          SmallText(text: "Name: ${transfer.reciever}"),
          SmallText(text: "ID: ${transfer.idr}"),
          SizedBox(height: Dimension.scaleHeight(8),),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmallText(text: "Value",size: Dimension.scaleHeight(16),)
            ],),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmallText(text: transfer.value.toString(),size: Dimension.scaleHeight(16),)
            ],),


        ],
      ),
    );
  }
}
