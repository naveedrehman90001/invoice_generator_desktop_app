import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:spicy_destop_invoic_app/models/cartModel.dart';
import 'package:spicy_destop_invoic_app/models/categories.dart';
import 'package:spicy_destop_invoic_app/models/subCategory.dart';
import 'package:spicy_destop_invoic_app/utils/categoryjson.dart';
import 'package:spicy_destop_invoic_app/utils/data.dart';
import 'package:spicy_destop_invoic_app/widgets/displayCartHeader.dart';
import 'package:spicy_destop_invoic_app/widgets/displayCartRow.dart';
import 'package:spicy_destop_invoic_app/widgets/itemTile.dart';
import 'package:spicy_destop_invoic_app/widgets/menuListTile.dart';
import 'myView.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSelectedTable = false;
  int selectedTable;
  int selectedCategoryIndex;

  String selectedCategory;
  double totalPrice;
  int changeNum = 0;
  int changeNum2 = 0;

  int count = 0;

  // _incrementQty() {
  //   count++;
  //   setState(() {});
  // }

  // _decrementQty() {
  //   count--;
  //   setState(() {});
  // }

  // var _data = CustomData();
  // @override
  // void initState() {
  //   _data = CustomData(name: 'value');
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.red,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/back.jpg'),
                  fit: BoxFit.cover)),
          child: ValueListenableBuilder<Box<CartModel>>(
              valueListenable: Hive.box<CartModel>(cartBox).listenable(),
              builder: (context, cartBox, _) {
                var allCart = cartBox.values.toList().cast<CartModel>();
                var allKeys = cartBox.keys.toList();
                List<CartModel> myNewCart = List();

                for (int i = 0; i < allCart.length; i++) {
                  CartModel a = CartModel(
                    img: allCart[i].img,
                    item: allCart[i].item,
                    price: allCart[i].price,
                    quantity: allCart[i].quantity,
                    tableNo: allCart[i].tableNo,
                    key: allKeys[i].toInt(),
                  );
                  myNewCart.add(a);
                }

                List<CartModel> currentCart = List();
                if (selectedTable != null) {
                  currentCart = myNewCart
                      .where((element) => (element.tableNo == selectedTable))
                      .toList();
                  totalPrice = 0;
                  try {
                    currentCart.forEach((element) {
                      // prices.add(double.parse((element.price).toString()));
                      // quantites.add(element.quantity);
                      totalPrice += (element.price * element.quantity);
                    });
                  } catch (e) {
                    print(e);

                    totalPrice = 0;
                  }
                }
                return Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.17,
                      height: deviceSize.height,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54,
                              blurRadius: 15.0,
                              offset: Offset(0.0, 0.75))
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey),
                              ),
                            ),
                            child: Image.asset(
                              'assets/images/splogo.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              'Tables',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          ValueListenableBuilder(
                              valueListenable:
                                  Hive.box<int>(tableBox).listenable(),
                              builder: (context, box, _) {
                                return Container(
                                  height: 150,
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.0, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  // color: Colors.green,

                                  child: (box.isEmpty)
                                      ? InkWell(
                                          onTap: () =>
                                              box.put(box.length, box.length),
                                          onLongPress: () =>
                                              box.deleteAt(box.length - 1),
                                          child: Container(
                                            margin: EdgeInsets.all(5.0),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1.0,
                                                  color: Colors.grey),
                                            ),
                                            child: Center(
                                                child: Icon(Icons
                                                    .add) //Text('$index',style: TextStyle(color: isSelectedTable ? Colors.purple : Colors.white),),
                                                ),
                                          ),
                                        )
                                      : GridView.builder(
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4,
                                          ),
                                          itemCount: box.length + 1,
                                          itemBuilder: (_, index) {
                                            return (box.length == index)
                                                ? InkWell(
                                                    onTap: () => box.put(
                                                        box.length, box.length),
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.all(5.0),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 1.0,
                                                            color: Colors.grey),
                                                      ),
                                                      child: Center(
                                                          child: Icon(Icons
                                                              .add) //Text('$index',style: TextStyle(color: isSelectedTable ? Colors.purple : Colors.white),),
                                                          ),
                                                    ),
                                                  )
                                                : InkWell(
                                                    onTap: () {
                                                      selectedTable = index;
                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.all(5.0),
                                                      decoration:
                                                          selectedTable != index
                                                              ? BoxDecoration(
                                                                  border: Border.all(
                                                                      width:
                                                                          1.0,
                                                                      color: Colors
                                                                          .grey),
                                                                )
                                                              : BoxDecoration(
                                                                  color: Colors
                                                                      .purple,
                                                                ),
                                                      child: Center(
                                                        child: Text(
                                                          '${index}',
                                                          style: TextStyle(
                                                              color: selectedTable !=
                                                                      index
                                                                  ? Colors
                                                                      .purple
                                                                  : Colors
                                                                      .white),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                          }),
                                );
                              }),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 10, bottom: 10),
                            child: Text(
                              'Categories',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height * 0.40,
                              child: ValueListenableBuilder<Box<Categories>>(
                                  valueListenable:
                                      Hive.box<Categories>(categoryBox)
                                          .listenable(),
                                  builder: (context, categBox, _) {
                                    var cate = categBox.values
                                        .toList()
                                        .cast<Categories>();

                                    return ListView.builder(
                                      itemCount: cate.length + 1,
                                      itemBuilder: (context, index) {
                                        // print("key is ${myRealList[index].key}");
                                        return (cate.length == index)
                                            ? ListTile(
                                                leading: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                        color: Colors.purple,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0)),
                                                    child: Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                    )),
                                                onTap: () {
                                                  _showMyDialogAdd(
                                                      cate, categBox);
                                                },
                                                onLongPress: () {
                                                  changeNum++;
                                                  setState(() {});
                                                  if (changeNum == 2) {
                                                    categoryJson.forEach(
                                                        (element) async {
                                                      Categories categories =
                                                          Categories.fromJson(
                                                              element);
                                                      await categBox
                                                          .add(categories);
                                                    });
                                                  }
                                                },
                                              )
                                            : InkWell(
                                                onTap: () {
                                                  selectedCategoryIndex = index;
                                                  selectedCategory =
                                                      cate[index].categoryName;
                                                  // subList =
                                                  //     cate[index].subcatery;
                                                  setState(() {});
                                                },
                                                onLongPress: () {
                                                  categBox.deleteAt(index);
                                                  // categBox.clear();
                                                  // categBox.delete(myRealList[index].key);
                                                },
                                                child: menuListTile(
                                                    title: cate[index]
                                                        .categoryName,
                                                    myIndex: index,
                                                    selectedIndex:
                                                        selectedCategoryIndex ??
                                                            -1),
                                              );
                                      },
                                    );
                                  })),
                          Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/dotcoderlogo.png')),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: deviceSize.height,
                        child: Row(
                          children: [
                            Flexible(
                                flex: 10,
                                child: Container(
                                  // margin: EdgeInsets.only(left: 20 ),
                                  child: Column(
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        fit: FlexFit.tight,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            top: 20,
                                            left: 20,
                                            right: 20,
                                          ),
                                          color: Colors.white,
                                          child: Center(
                                            child: Text(
                                              'Table ' +
                                                      selectedTable
                                                          .toString() ??
                                                  "",
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  color: Colors.purple,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                          flex: 5,
                                          fit: FlexFit.tight,
                                          child:
                                              ValueListenableBuilder<
                                                      Box<SubCategory>>(
                                                  valueListenable:
                                                      Hive.box<SubCategory>(
                                                              subCategoryBox)
                                                          .listenable(),
                                                  builder:
                                                      (context, subCatBox, _) {
                                                    List<SubCategory> subCate =
                                                        subCatBox.values
                                                            .toList()
                                                            .cast<
                                                                SubCategory>();
                                                    print(subCate.length);
                                                    // List<SubCategory> fileredSub =
                                                    //     [];
                                                    // if (selectedCategory != null) {
                                                    //   fileredSub = subCate
                                                    //       .where((element) => (element
                                                    //           .categoryName
                                                    //           .contains(
                                                    //               selectedCategory)))
                                                    //       .toList();
                                                    // }
                                                    return Container(
                                                      child:
                                                          (selectedCategory ==
                                                                  null)
                                                              ? InkWell(
                                                                  onTap: () {
                                                                    subCatBox
                                                                        .clear();
                                                                  },
                                                                  child: Center(
                                                                    child: Text(
                                                                      'Category not Selected',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                )
                                                              : ListView(
                                                                  children: [
                                                                      Wrap(
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        runSpacing:
                                                                            10,
                                                                        spacing:
                                                                            20,
                                                                        children: List<Widget>.generate(
                                                                            subCate.length +
                                                                                1,
                                                                            (index) {
                                                                          return (subCate.length == index)
                                                                              ? InkWell(
                                                                                  onTap: () async {
                                                                                    //  _showMyDialogAddSubCategory(fileredSub, subCatBox);

                                                                                    _showMyDialogAddSubCategory(subCate, subCatBox);
                                                                                  },
                                                                                  onLongPress: () {
                                                                                    changeNum2++;
                                                                                    setState(() {});
                                                                                    if (changeNum2 == 2) {
                                                                                      subJson.forEach((element) async {
                                                                                        print(element['itemName']);
                                                                                        SubCategory subM = SubCategory.fromJson(element);
                                                                                        print(subM.categoryName);
                                                                                        await subCatBox.add(subM).then((value) {
                                                                                          print('my val is $value');
                                                                                        });
                                                                                      });
                                                                                    }
                                                                                  },
                                                                                  child: Container(
                                                                                    height: 200,
                                                                                    width: 200,
                                                                                    margin: EdgeInsets.all(10),
                                                                                    decoration: BoxDecoration(
                                                                                      color: Colors.purple,
                                                                                      borderRadius: BorderRadius.circular(5.0),
                                                                                    ),
                                                                                    child: Icon(
                                                                                      Icons.add,
                                                                                      color: Colors.white,
                                                                                    ),
                                                                                  ),
                                                                                )
                                                                              : (subCate[index].categoryName == selectedCategory)
                                                                                  ? InkWell(
                                                                                      onTap: () {
                                                                                        CartModel mycart;
                                                                                        (selectedTable == null)
                                                                                            ? {
                                                                                                print('error'),
                                                                                                _showMyDialogError('Select table First'),
                                                                                              }
                                                                                            : {
                                                                                                mycart = CartModel(
                                                                                                  img: subCate[index].itemImage,
                                                                                                  item: subCate[index].itemName,
                                                                                                  price: subCate[index].price,
                                                                                                  quantity: subCate[index].quantity,
                                                                                                  tableNo: selectedTable,
                                                                                                ),

                                                                                                (currentCart.where((element) => (element.item == mycart.item)).toList().isEmpty) ? cartBox.add(mycart) : _showMyDialogError('Add quantity in Cart'), //_showPrintedToast(context)
                                                                                              };
                                                                                      },
                                                                                      child: Container(
                                                                                          height: 200,
                                                                                          width: 200,
                                                                                          child: itemTile(
                                                                                              subCategory: subCate[index],
                                                                                              edit: () {
                                                                                                SubCategory b = SubCategory(
                                                                                                  categoryName: subCate[index].categoryName,
                                                                                                  itemImage: subCate[index].itemImage,
                                                                                                  itemName: subCate[index].itemName,
                                                                                                  price: subCate[index].price + 5,
                                                                                                  quantity: subCate[index].quantity,
                                                                                                );
                                                                                                subCatBox.putAt(index, b);
                                                                                              },
                                                                                              delete: () {
                                                                                                subCatBox.deleteAt(index);
                                                                                              })),
                                                                                    )
                                                                                  : SizedBox();
                                                                        }),
                                                                        // displayItemTileWidget(
                                                                        //   myList: subCate,
                                                                        //   currCart: currentCart,
                                                                        //   myBox: cartBox
                                                                        //     // subCate,currentCart,
                                                                        //     ),
                                                                      ),
                                                                    ]),
                                                      // GridView.builder(
                                                      //     gridDelegate:
                                                      //         SliverGridDelegateWithFixedCrossAxisCount(
                                                      //       crossAxisCount:
                                                      //           4,
                                                      //       childAspectRatio:
                                                      //           0.90,
                                                      //     ),
                                                      //     itemCount: fileredSub
                                                      //             .length +
                                                      //         1,
                                                      //     // cate[selectedCategoryIndex].subcatery.length + 1,
                                                      //     itemBuilder:
                                                      //         (_, index) {
                                                      //       return (fileredSub
                                                      //                   .length ==
                                                      //               index)
                                                      //           ? InkWell(
                                                      //               onTap:
                                                      //                   () async {
                                                      //                 //  _showMyDialogAddSubCategory(fileredSub, subCatBox);

                                                      //                 _showMyDialogAddSubCategory(
                                                      //                     fileredSub,
                                                      //                     subCatBox);
                                                      //               },
                                                      //               onLongPress:
                                                      //                   () {
                                                      //                 changeNum2++;
                                                      //                 setState(
                                                      //                     () {});
                                                      //                 if (changeNum2 ==
                                                      //                     2) {
                                                      //                   subJson.forEach((element) async {
                                                      //                     print(element['itemName']);
                                                      //                     SubCategory subM = SubCategory.fromJson(element);
                                                      //                     print(subM.categoryName);
                                                      //                     await subCatBox.add(subM).then((value) {
                                                      //                       print('my val is $value');
                                                      //                     });
                                                      //                   });
                                                      //                 }
                                                      //               },
                                                      //               child:
                                                      //                   Container(
                                                      //                 // color: Colors.green,
                                                      //                 margin:
                                                      //                     EdgeInsets.all(10),
                                                      //                 decoration:
                                                      //                     BoxDecoration(
                                                      //                   color:
                                                      //                       Colors.purple,
                                                      //                   borderRadius:
                                                      //                       BorderRadius.circular(5.0),
                                                      //                 ),
                                                      //                 child:
                                                      //                     Icon(
                                                      //                   Icons.add,
                                                      //                   color:
                                                      //                       Colors.white,
                                                      //                 ),
                                                      //               ),
                                                      //             )
                                                      //           : InkWell(
                                                      //               onTap:
                                                      //                   () {
                                                      //                 CartModel
                                                      //                     mycart;
                                                      //                 (selectedTable == null)
                                                      //                     ? {
                                                      //                         print('error'),
                                                      //                         _showMyDialogError('Select table First'),
                                                      //                       }
                                                      //                     : {
                                                      //                         mycart = CartModel(
                                                      //                           img: fileredSub[index].itemImage,
                                                      //                           item: fileredSub[index].itemName,
                                                      //                           price: fileredSub[index].price,
                                                      //                           quantity: fileredSub[index].quantity,
                                                      //                           tableNo: selectedTable,
                                                      //                         ),
                                                      //                         (currentCart.where((element) => (element.item == mycart.item)).toList().isEmpty) ? cartBox.add(mycart) : _showMyDialogError('Add quantity in Cart'), //_showPrintedToast(context)
                                                      //                       };
                                                      //               },
                                                      //               child: itemTile(
                                                      //                   fileredSub[index]));
                                                      //     }),
                                                    );
                                                  })),
                                    ],
                                  ),
                                )),
                            Flexible(
                                flex: 5,
                                child: Container(
                                  // color: Colors.red,
                                  margin: EdgeInsets.only(right: 20, top: 25),
                                  child: Column(
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        fit: FlexFit.tight,
                                        child: Container(
                                          // color: Colors.teal,
                                          color: Colors.white,
                                          child: Center(
                                            child: InkWell(
                                              onTap: () => cartBox.clear(),
                                              child: Text(
                                                'CheckOut',
                                                style: TextStyle(fontSize: 25),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        fit: FlexFit.tight,
                                        child: Container(
                                          color: Colors.purple,
                                          child: displayCartHeader(),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 8,
                                        fit: FlexFit.tight,
                                        child: Container(
                                          color: Colors.white,
                                          child: ListView.builder(
                                            // separatorBuilder:
                                            //     (context, index) => Divider(),
                                            itemCount: allCart.length,
                                            itemBuilder: (context, index) {
                                              return (allCart[index].tableNo ==
                                                      selectedTable)
                                                  ? displayCartRow(
                                                      cartModel: allCart[index],
                                                      decreaseQty: () {
                                                        if (allCart[index]
                                                                .quantity >
                                                            1) {
                                                          CartModel thisCart =
                                                              CartModel(
                                                            img: allCart[index]
                                                                .img,
                                                            tableNo:
                                                                allCart[index]
                                                                    .tableNo,
                                                            item: allCart[index]
                                                                .item,
                                                            price:
                                                                allCart[index]
                                                                    .price,
                                                            quantity: allCart[
                                                                        index]
                                                                    .quantity -
                                                                1,
                                                          );
                                                          cartBox.putAt(
                                                              index, thisCart);
                                                        }
                                                      },
                                                      increaseQty: () {
                                                        CartModel thisCart = CartModel(
                                                            img: allCart[index]
                                                                .img,
                                                            tableNo:
                                                                allCart[index]
                                                                    .tableNo,
                                                            item: allCart[index]
                                                                .item,
                                                            price:
                                                                allCart[index]
                                                                    .price,
                                                            quantity: allCart[
                                                                        index]
                                                                    .quantity +
                                                                1);
                                                        cartBox.putAt(
                                                            index, thisCart);
                                                      },
                                                      delItem: () => cartBox
                                                          .deleteAt(index),
                                                    )
                                                  : SizedBox();
                                            },
                                          ),
                                        ),
                                        // }),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        fit: FlexFit.tight,
                                        child: Container(
                                          color: Colors.red,
                                          child: Row(
                                            children: [
                                              Flexible(
                                                flex: 2,
                                                fit: FlexFit.tight,
                                                child: Container(
                                                  color: Colors.purple,
                                                  child: Center(
                                                    child: Text(
                                                      'Total ',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                flex: 3,
                                                fit: FlexFit.tight,
                                                child: Container(
                                                  color: Colors.purple,
                                                  child: Center(
                                                    child: Text(
                                                      totalPrice.toString(),
                                                      // allCart.fold("0.0", (previousValue, element) => element.price).toString(),
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        fit: FlexFit.tight,
                                        child: Container(
                                          width: double.infinity,
                                          margin: EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          color: Colors.white,
                                          child: MaterialButton(
                                            onPressed: () async {
                                              if (selectedTable == null) {
                                              } else {
                                                print("before print");

                                                // for(int i=0;i>cartBox.length;i++){
                                                //   allCart[i].tableNo==selectedTable;
                                                //   cartBox.deleteAt(i);
                                                // }
                                                if (currentCart.isEmpty) {
                                                } else {
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            MyViewPrint(
                                                              currentCart,
                                                              totalPrice,
                                                              () {},
                                                            )),
                                                  ).then((value) {
                                                    List keys = [];
                                                    currentCart
                                                        .forEach((element) {
                                                      keys.add(element.key);
                                                    });

                                                    print(keys.length);
                                                    cartBox
                                                        .deleteAll(keys)
                                                        .then((val) {
                                                      print('in then');
                                                    });
                                                  });
                                                }
                                              }
                                            },
                                            child: Text(
                                              'Pay',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        fit: FlexFit.tight,
                                        child: Container(
                                          width: double.infinity,
                                          // color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // }),
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }

  List<Widget> displayItemTileWidget(
      {List<SubCategory> myList,
      List<CartModel> currCart,
      Box myBox,
      Box subC}) {
    List<Widget> widgetList = List();
    myList.forEach((element) {});

    return widgetList;
  }

  Future<void> _showMyDialogError(String error) async {
    return showDialog<void>(
      context: context,
      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(error),
                // Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showPrintedToast(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(title),
      ),
    );
  }

  _showMyDialogAdd(List<Categories> myList, Box myBox) async {
    TextEditingController controller = TextEditingController();
    return showDialog<void>(
      context: context,
      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Category'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Category Name',
                    hintStyle: TextStyle(
                        fontSize:
                            15), //TextStyles.normalFontText.copyWith(fontSize: 15),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    ),
                  ),
                  style: TextStyle(fontSize: 20),
                  controller: controller,
                  keyboardType: TextInputType.name,
                )
                // Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                Categories cat;
                controller.text.isEmpty
                    ? _showPrintedToast(context, "Category cannot be empty")
                    : {
                        cat = Categories(
                          categoryName: controller.text,
                          imageName: '',
                        ),
                        myList
                                .where((element) =>
                                    element.categoryName == cat.categoryName)
                                .toList()
                                .isEmpty
                            ? {myBox.add(cat), Navigator.of(context).pop()}
                            : _showMyDialogError(
                                "${cat.categoryName} already exist"),
                        // Navigator.of(context).pop();
                      };
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _showMyDialogAddSubCategory(List<SubCategory> myList, Box myBox) async {
    TextEditingController controller = TextEditingController();
    TextEditingController priceController = TextEditingController();
    return showDialog<void>(
      context: context,
      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add SubCategory'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: ' Name',
                    hintStyle: TextStyle(
                        fontSize:
                            15), //TextStyles.normalFontText.copyWith(fontSize: 15),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    ),
                  ),
                  style: TextStyle(fontSize: 20),
                  controller: controller,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 10,
                ),

                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Price',
                    hintStyle: TextStyle(
                        fontSize:
                            15), //TextStyles.normalFontText.copyWith(fontSize: 15),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    ),
                  ),
                  style: TextStyle(fontSize: 20),
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                ),
                // Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                SubCategory sub;
                controller.text.isEmpty
                    ? _showPrintedToast(context, "Name cannot be empty")
                    : priceController.text.isEmpty
                        ? _showPrintedToast(context, "Price cannot be empty")
                        : {
                            sub = SubCategory(
                              categoryName: selectedCategory,
                              itemImage: "",
                              itemName: controller.text,
                              price: double.tryParse(priceController.text),
                              quantity: 1,
                            ),
                            (myList
                                    .where((element) =>
                                        element.itemName == sub.itemName)
                                    .toList()
                                    .isEmpty)
                                ? {myBox.add(sub), Navigator.of(context).pop()}
                                : _showMyDialogError(
                                    "${sub.itemName} already Exist"),
                          };
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
