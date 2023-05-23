import 'package:app/db/database_customer_helper.dart';
import 'package:app/db/database_transfer_helper.dart';
import 'package:app/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'controllers/customer_controller.dart';
import 'controllers/transfer_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await DBCustomerHelper.initDb();
  await DBTransferHelper.initDb();
  CustomersController().initDb();
  TransferController().getTransfers();



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

