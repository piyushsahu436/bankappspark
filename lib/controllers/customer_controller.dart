import 'package:app/utils/dummy_data.dart';
import 'package:get/get.dart';

import '../db/database_customer_helper.dart';
import '../model/customer_model.dart';

class CustomersController extends GetxController{

 static List customerList=[].obs;
 void initDb()async
 {
  await getCustomers();
   if(customerList.length==0)
     {
       for(int i=0;i<DummyData.customersList.length;i++)
         {
           insertData(DummyData.customersList[i]);
         }
     }
  await getCustomers();

 }
 void insertData (Customer customer)
 async {
   await DBCustomerHelper.insert(customer);
   await getCustomers();
 }
 void updateData (Customer customer)
 async {
   await DBCustomerHelper.update(customer.id!, customer.balance!.toString());
  await getCustomers();
 }
 getCustomers() async {
   final List<Map<String, dynamic>> customers = await DBCustomerHelper.query();
   customerList.assignAll(customers.map((data) => Customer.fromjson(data)).toList());
   update();
print(customerList);
 }


}