import'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:spicy_destop_invoic_app/home/homePage.dart';
import 'package:hive_flutter/hive_flutter.dart';


Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox<String>('tableBox');
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

  Box<String> tableBox;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}