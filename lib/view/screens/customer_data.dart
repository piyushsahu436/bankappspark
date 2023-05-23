import 'package:app/controllers/transfer_controller.dart';
import 'package:app/view/widgets/bit_text.dart';
import 'package:app/view/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/customer_controller.dart';
import '../../model/customer_model.dart';
import '../../model/transfer_model.dart';
import '../../utils/dimensionScale.dart';
import '../widgets/main_button.dart';

class CustomerDataScreen extends StatelessWidget {
  final Customer customer;
  Customer? Reciever;
  double? val;
  GlobalKey controller = GlobalKey();
  GlobalKey controller2 = GlobalKey();
  final formKey = GlobalKey<FormState>();

  CustomerDataScreen(this.customer);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white, Colors.white],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(Icons.arrow_back_ios)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Dimension.scaleHeight(20),
                    ),
                    BigText(text: customer.name!),
                    SizedBox(
                      height: Dimension.scaleHeight(60),
                    ),
                    DataViewBuilder(),
                    SizedBox(
                      height: Dimension.scaleHeight(20),
                    ),
                    Form(
                        key: formKey,
                        child: Column(
                          children: [
                            textField(controller, "Reciever"),
                            SizedBox(
                              height: Dimension.scaleHeight(10),
                            ),
                            textField(controller2, "Value"),
                            SizedBox(
                              height: Dimension.scaleHeight(20),
                            ),
                            MainButton(
                                title: "Transfer",
                                event: () async{
                                  if (formKey.currentState!.validate()) {
                                    customer.balance = customer.balance! - val!;
                                    CustomersController().updateData(customer);
                                    Reciever!.balance =
                                        Reciever!.balance! + val!;
                                     CustomersController().updateData(Reciever!);
                                     TransferController().insertData(Transfer(
                                        sender: customer.name,
                                        ids: customer.id,
                                        value: val,
                                        reciever: Reciever!.name!,
                                        idr: Reciever!.id!,
                                        time: DateTime.now().toString()));

                                    Get.back();

                                  }

                                })
                          ],
                        ))
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Widget DataViewBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        itemViewBuilder("ID", customer.id!),
        itemViewBuilder("Social Number", customer.socialNumber!),
        itemViewBuilder("Nationality", customer.nationality!),
        itemViewBuilder("Gender", customer.gender!),
        itemViewBuilder("Phone", customer.phone!),
        itemViewBuilder("Balance", customer.balance.toString()),
        itemViewBuilder("Date of birth", customer.dateOfBirth!),
      ],
    );
  }

  Widget itemViewBuilder(String label, String data) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimension.scaleHeight(10)),
      child: SmallText(
        text: "$label: $data ",
        size: Dimension.scaleHeight(15),
      ),
    );
  }

  Widget textField(GlobalKey controller, String title) {
    return Container(
      width: Dimension.screenWidth - Dimension.scaleWidth(40),
      child: Column(
        children: [
          TextFormField(
              key: controller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                if(title=="Reciever")
                Reciever = CustomersController.customerList
                    .firstWhereOrNull((element) => element.id == value);
                if (title == "Reciever" && Reciever == null) {
                  return 'Please enter valid id';
                }
                if (title == "Value" &&
                    double.parse(value.trim()) > customer.balance!) {

                  return 'Please enter valid value';
                }
 if(title=="Value")
   val = double.parse(value.trim());
                return null;
              },
              decoration: InputDecoration(
                labelText: title,
                fillColor: Colors.blue,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ))
        ],
      ),
    );
  }
}
