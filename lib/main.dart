import 'dart:io';
import 'package:flutter/foundation.dart';
import'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:spicy_destop_invoic_app/home/homePage.dart';
import 'package:spicy_destop_invoic_app/models/cartModel.dart';
import 'package:spicy_destop_invoic_app/models/categories.dart';
import 'package:spicy_destop_invoic_app/models/subCategory.dart';
import 'package:spicy_destop_invoic_app/utils/data.dart';
import 'home/myTestingTable.dart';



Future<void> _openBox() async {

   await Hive.openBox<Categories>(categoryBox);
   await Hive.openBox<CartModel>(cartBox);
  await Hive.openBox<int>(tableBox);

 
}

bool Use_Emulator = true;
Future<void> main() async {
// WidgetsFlutterBinding.ensureInitialized();
// await Firebase.initializeApp();
// String host = '';

// if(kIsWeb){
//   host = '10.1.81.182:8080';
// }else if(Platform.isAndroid){
//     host = '10.0.2.2:8080';
// }else if (Platform.isIOS){
//   host = '10.1.81.182:8080';
// }
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(CartModelAdapter());
  Hive.registerAdapter(CategoriesAdapter());
  Hive.registerAdapter(SubCategoryAdapter());
  await Hive.initFlutter();
  // await _openBox();
// if(Use_Emulator){
//   FirebaseFirestore.instance.settings = Settings(
//     host: host,sslEnabled: false,
//   );
// }

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
      // home: HomePage(),
      home: FutureBuilder(
            future: Future.wait([
              Hive.openBox<int>(tableBox),
              Hive.openBox<CartModel>(cartBox),
              Hive.openBox<Categories>(categoryBox),
              Hive.openBox<SubCategory>(subCategoryBox),
            ]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.error != null) {
                  print(snapshot.error);
                  return Scaffold(
                    body: Center(
                      child: Text('Something went wrong :/'),
                    ),
                  );
                } else {
                  return  HomePage();
                }
              } else {
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
    );
  }
}