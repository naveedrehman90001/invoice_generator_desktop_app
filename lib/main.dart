import 'package:flutter/foundation.dart';
import'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:spicy_destop_invoic_app/models/cartModel.dart';
import 'package:spicy_destop_invoic_app/models/categories.dart';
import 'package:spicy_destop_invoic_app/utils/data.dart';

import 'home/myTestingTable.dart';



Future<void> _openBox() async {

   await Hive.openBox<Category>(categoryBox);
   await Hive.openBox<CartModel>(cartBox);
  await Hive.openBox<int>(tableBox);

 
}
Future<void> main() async {
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(CartModelAdapter());
  Hive.registerAdapter(CategoriesAdapter());
  // await Hive.initFlutter();
  await _openBox();
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }


class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // Box<String> tableBox;

  //  @override
  // void initState() {
  //   super.initState();
  //   tableBox = Hive.box('tableBox');
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyTestingTable(),
    );
  }
}