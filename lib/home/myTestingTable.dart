import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:spicy_destop_invoic_app/models/cartModel.dart';
import 'package:spicy_destop_invoic_app/utils/data.dart';

class MyTestingTable extends StatefulWidget {

  @override
  _MyTestingTableState createState() => _MyTestingTableState();
}

class _MyTestingTableState extends State<MyTestingTable> {

  // Box<int> myTable;
  // Box<CartModel> cart;

  //  @override
  // void initState() {
  //   super.initState();
  //   myTable = Hive.box(tableBox);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("table w/ Hive"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
          // box.put(tableBox.length+1, tableBox.length+1);
          },
        ),
        body: ValueListenableBuilder(
          valueListenable: Hive.box<int>(tableBox).listenable(),
          builder: (context,  box, _) {

            return (box.isEmpty)?
            InkWell(
              onTap: ()=>box.put(box.length, box.length),
              child: Text('No Data')):
             ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                print(box.length);
                print(tableBox.length);
                return
                 ListTile(
                   leading: InkWell(
                     onTap: ()=>box.put(box.length, box.length),
                     child: Icon(Icons.add)),
                  title: Text(box.values.toString()),
                  subtitle: Text(box.keys.toString()),
                  trailing: IconButton(
                    icon:Icon(Icons.delete),// getIcon(listIndex),
                  onPressed: () =>box.deleteAt(index),// print(myTable.values.toString())//(""),
                  ),
                );
              },
            );
          },
        ),
      );
  }
}