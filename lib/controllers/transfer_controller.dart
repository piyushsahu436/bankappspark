

import 'package:app/db/database_transfer_helper.dart';
import 'package:app/model/transfer_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TransferController extends GetxController{

  static List transferList=[].obs;
  void initDb()async
  {
   await getTransfers();
  }
  void insertData (Transfer transfer)
  async {
    await DBTransferHelper.insert(transfer);
    await getTransfers();

  }

  getTransfers() async {
    final List<Map<String, dynamic>> customers = await DBTransferHelper.query();
    transferList.assignAll(customers.map((data) => Transfer.fromjson(data)).toList());
    update();
    print(transferList.length);
  }


}