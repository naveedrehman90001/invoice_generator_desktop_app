import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:spicy_destop_invoic_app/models/cartModel.dart';
import 'package:spicy_destop_invoic_app/models/categories.dart';
import 'package:spicy_destop_invoic_app/models/subCategory.dart';
import 'package:spicy_destop_invoic_app/utils/data.dart';
import 'package:spicy_destop_invoic_app/widgets/itemTile.dart';
import 'package:spicy_destop_invoic_app/widgets/menuListTile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSelectedTable = false;
  int selectedTable;
  int selectedCategoryIndex;

  Categories selectedCategory;

  List<String> categoriesList = [
    'Pizza',
    'Burger',
    'Chicken Pcs',
    'Wings',
    'Fries',
    'Paratha Role',
    'Chinese',
    'Shawarma',
    'Turkish',
    'Pasta',
    'Soup',
    'Sansages',
    'Drinks'
  ];

  int count = 0;

  _incrementQty() {
    count++;
    setState(() {});
  }

  _decrementQty() {
    count--;
    setState(() {});
  }

  var categoryBoxxx;
  getCategoryBox() async {
    categoryBoxxx = await Hive.box(categoryBox);
    setState(() {});
  }

  List<SubCategory> subList = [];
  @override
  void initState() {
    getCategoryBox();
    super.initState();
  }

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
          child: Row(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: Image.network(
                              "https://www.libracoffee.io/img/app-logo.18b670b8.jpg",
                              width: 150,
                            ),
                          ),
                        ],
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
                        valueListenable: Hive.box<int>(tableBox).listenable(),
                        builder: (context, box, _) {
                          return Container(
                            height: 150,
                            margin: EdgeInsets.only(left: 10, right: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1.0, color: Colors.grey),
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
                                            width: 1.0, color: Colors.grey),
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
                                          : InkWell(
                                              onTap: () {
                                                selectedTable = index;
                                                setState(() {});
                                              },
                                              child: Container(
                                                margin: EdgeInsets.all(5.0),
                                                decoration: selectedTable !=
                                                        index
                                                    ? BoxDecoration(
                                                        border: Border.all(
                                                            width: 1.0,
                                                            color: Colors.grey),
                                                      )
                                                    : BoxDecoration(
                                                        color: Colors.purple,
                                                      ),
                                                child: Center(
                                                  child: Text(
                                                    '$index',
                                                    style: TextStyle(
                                                        color: selectedTable !=
                                                                index
                                                            ? Colors.purple
                                                            : Colors.white),
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
                    ValueListenableBuilder<Box<Categories>>(
                        valueListenable:
                            Hive.box<Categories>(categoryBox).listenable(),
                        builder: (context, box, _) {
                          var cate = box.values.toList().cast<Categories>();
                          return Container(
                              height: MediaQuery.of(context).size.height * 0.38,
                              child: (box == null)
                                  ? InkWell(
                                      onTap: () {
                                        Categories cat = Categories(
                                          categoryName: 'Pizza',
                                          imageName: '',
                                          subcatery: [],
                                        );
                                        box.add(cat);
                                      },
                                      child: Container(
                                        child: Icon(Icons.add),
                                      ),
                                    )
                                  : ListView.builder(
                                      itemCount: cate.length + 1,
                                      // physics: NeverScrollableScrollPhysics(),
                                      // shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return (cate.length == index)
                                            ? ListTile(
                                                leading: Icon(Icons.add),
                                                onTap: () {
                                                  Categories cat = Categories(
                                                    categoryName: 'Pizza',
                                                    imageName: '',
                                                    subcatery: [],
                                                  );
                                                  box.add(cat);
                                                },
                                              )
                                            : InkWell(
                                                onTap: () {
                                                  selectedCategoryIndex = index;
                                                  selectedCategory =cate[index];
                                                  subList =
                                                      cate[index].subcatery;
                                                  setState(() {});
                                                },
                                                onLongPress: (){
                                                  box.deleteAt(index);
                                                },
                                                child: menuListTile(
                                                  title:
                                                      cate[index].categoryName,
                                                ),
                                              );
                                      },
                                    ));
                        }),
                    Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/dotcoderlogo.png')),
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
                                        'Table ' + selectedTable.toString() ??
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
                                  child: Container(
                                    child: (selectedCategoryIndex == null)
                                        ? Center(
                                            child: Text(
                                              'Category not Selected',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )
                                        : (subList == null)
                                            ? InkWell(
                                              onTap: (){
                                                SubCategory sub = SubCategory(
                                                  itemImage: "",
                                                  itemName: "kbx",
                                                  price: 600,
                                                  quantity: 1,
                                                );
                                                selectedCategory.subcatery.add(sub);
                                                categoryBoxxx.putAt(selectedCategoryIndex,selectedCategory );
                                              },
                                              child: Container(
                                                  child: Center(
                                                  child: Text(
                                                    'Category is Empty\nClick To add SubCategory',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                )),
                                            )
                                            : (subList.isEmpty)
                                                ? InkWell(
                                                  onTap: (){
                                                SubCategory sub = SubCategory(
                                                  itemImage: "",
                                                  itemName: "tfytf",
                                                  price: 500,
                                                  quantity: 1,
                                                );
                                                selectedCategory.subcatery.add(sub);
                                                print(selectedCategory.subcatery.length);
                                               categoryBoxxx.putAt(selectedCategoryIndex,selectedCategory );
                                              },
                                                  child: Container(
                                                      child: Center(
                                                      child: Text(
                                                        'Category is Empty\nClick To add SubCategory',
                                                        style: TextStyle(
                                                            color: Colors.white),
                                                      ),
                                                    )),
                                                )
                                                : GridView.builder(
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 4,
                                                      childAspectRatio: 0.90,
                                                    ),
                                                    itemCount:
                                                        subList.length + 1,
                                                    itemBuilder: (_, index) {
                                                      return (subList.length ==
                                                              index)
                                                          ? Container(
                                                            color: Colors.green,
                                                              child: Icon(
                                                                  Icons.add),
                                                            )
                                                          : InkWell(
                                                            child: itemTile(subList[index]));
                                                    }),
                                  ),
                                ),
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
                                      child: Text(
                                        'CheckOut',
                                        style: TextStyle(fontSize: 25),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  fit: FlexFit.tight,
                                  child: Container(
                                    color: Colors.purple,
                                    child: Row(
                                      children: [
                                        Flexible(
                                          flex: 4,
                                          fit: FlexFit.tight,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 10),
                                            child: Text(
                                              'Name',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 2,
                                          fit: FlexFit.tight,
                                          child: Container(
                                            child: Text(
                                              'Qty',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 2,
                                          fit: FlexFit.tight,
                                          child: Container(
                                            child: Text(
                                              'Price',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          fit: FlexFit.tight,
                                          child: Container(
                                            child: Text(
                                              'Del',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 8,
                                  fit: FlexFit.tight,
                                  child: ValueListenableBuilder<Box<CartModel>>(
                                      valueListenable:
                                          Hive.box<CartModel>(cartBox)
                                              .listenable(),
                                      builder: (context, box, _) {
                                        return Container(
                                          color: Colors.white,
                                          child: ListView.separated(
                                            separatorBuilder:
                                                (context, index) => Divider(),
                                            itemCount: 40,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  height: 40,
                                                  child: Row(
                                                    children: [
                                                      Flexible(
                                                        flex: 4,
                                                        fit: FlexFit.tight,
                                                        child: Container(
                                                          // color: Colors.amber,
                                                          child:
                                                              Text('My Prod'),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        flex: 2,
                                                        fit: FlexFit.tight,
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 5,
                                                                  bottom: 5,
                                                                  left: 5,
                                                                  right: 5),
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .grey)),
                                                          child: Row(
                                                            children: [
                                                              Flexible(
                                                                flex: 1,
                                                                fit: FlexFit
                                                                    .tight,
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    _decrementQty();
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .purple,
                                                                    ),
                                                                    child: Icon(
                                                                      Icons
                                                                          .remove,
                                                                      size: 12,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                flex: 2,
                                                                fit: FlexFit
                                                                    .tight,
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                        '$count'),
                                                                  ),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                flex: 1,
                                                                fit: FlexFit
                                                                    .tight,
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    _incrementQty();
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: double
                                                                        .infinity,
                                                                    color: Colors
                                                                        .purple,
                                                                    child: Icon(
                                                                      Icons.add,
                                                                      size: 12,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        flex: 2,
                                                        fit: FlexFit.tight,
                                                        child: Container(
                                                          child: Text('20000'),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        flex: 1,
                                                        fit: FlexFit.tight,
                                                        child: Container(
                                                          // color: Colors.amber,

                                                          child: Icon(
                                                            Icons
                                                                .delete_forever,
                                                            size: 18,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ));
                                            },
                                          ),
                                        );
                                      }),
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
                                                  fontWeight: FontWeight.w500,
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
                                                '2309',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
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
                                    margin: EdgeInsets.only(top: 5, bottom: 5),
                                    color: Colors.white,
                                    child: MaterialButton(
                                      onPressed: () {},
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
                            // child: Column(
                            //   children: [
                            //     Container(
                            //       height: 500,
                            //       width: double.infinity,
                            //       decoration: BoxDecoration(
                            //         color: Color(0xFFF1F1F1),
                            //         boxShadow: [
                            //           BoxShadow(
                            //               color: Colors.black54,
                            //               blurRadius: 15.0,
                            //               offset: Offset(0.0, 0.75))
                            //         ],
                            //         borderRadius:
                            //             BorderRadius.all(Radius.circular(2)),
                            //       ),
                            //       child: Column(
                            //         children: [
                            //           Container(
                            //             padding: EdgeInsets.all(15),
                            //             child: Text(
                            //               "Checkout",
                            //               style: TextStyle(
                            //                   color: Colors.black,
                            //                   fontWeight: FontWeight.normal,
                            //                   fontSize: 20),
                            //             ),
                            //           ),
                            //           Container(
                            //             padding: EdgeInsets.all(15),
                            //             color: Color(0xFFD1D1D1),
                            //             child: Row(
                            //               children: [
                            //                 Expanded(
                            //                   child: Text(
                            //                     "Name",
                            //                     style: TextStyle(
                            //                         color: Colors.black,
                            //                         fontWeight:
                            //                             FontWeight.normal,
                            //                         fontSize: 14),
                            //                   ),
                            //                 ),
                            //                 Spacer(),
                            //                 Text(
                            //                   "Qty",
                            //                   style: TextStyle(
                            //                       color: Colors.black,
                            //                       fontWeight: FontWeight.normal,
                            //                       fontSize: 14),
                            //                 ),
                            //                 SizedBox(
                            //                   width: 40,
                            //                 ),
                            //                 Text(
                            //                   "Price",
                            //                   style: TextStyle(
                            //                       color: Colors.black,
                            //                       fontWeight: FontWeight.normal,
                            //                       fontSize: 14),
                            //                 ),
                            //                 SizedBox(
                            //                   width: 80,
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //           Expanded(
                            //             child: ListView(
                            //               // shrinkWrap: true,
                            //               children: [
                            //                 Container(
                            //                   padding: EdgeInsets.only(
                            //                       left: 15,
                            //                       right: 15,
                            //                       bottom: 5),
                            //                   decoration: BoxDecoration(
                            //                       border: Border(
                            //                           bottom: BorderSide(
                            //                               color: Colors.grey,
                            //                               width: .5))),
                            //                   child: ListView.builder(
                            //                     itemCount: 5,
                            //                     shrinkWrap: true,
                            //                     itemBuilder: (context , index){
                            //                       return Row(
                            //                     children: [
                            //                       Expanded(
                            //                         child: Text(
                            //                           'My Product',
                            //                           style: TextStyle(
                            //                               color: Colors.black,
                            //                               fontWeight:
                            //                                   FontWeight.normal,
                            //                               fontSize: 14),
                            //                         ),
                            //                       ),
                            //                       Spacer(),
                            //                       Text(
                            //                         '23',
                            //                         style: TextStyle(
                            //                             color: Colors.black,
                            //                             fontWeight:
                            //                                 FontWeight.normal,
                            //                             fontSize: 14),
                            //                       ),
                            //                       SizedBox(
                            //                         width: 50,
                            //                       ),
                            //                       Text(
                            //                         '4309',
                            //                         style: TextStyle(
                            //                             color: Colors.black,
                            //                             fontWeight:
                            //                                 FontWeight.normal,
                            //                             fontSize: 14),
                            //                       ),
                            //                       SizedBox(
                            //                         width: 25,
                            //                       ),
                            //                       IconButton(
                            //                           icon: Icon(Icons.delete),
                            //                           onPressed: () {}),
                            //                       SizedBox(
                            //                         width: 5,
                            //                       ),
                            //                     ],
                            //                   );
                            //                     },
                            //                   ),
                            //                 ),
                            //                 // ProductCartTile(
                            //                 //   product: "Espresso",
                            //                 //   qty: 1,
                            //                 //   price: 4.35,
                            //                 // ),
                            //                 // ProductCartTile(
                            //                 //   product: "Choco Frappe",
                            //                 //   qty: 1,
                            //                 //   price: 7.00,
                            //                 // ),
                            //                 // ProductCartTile(
                            //                 //   product: "Caramel Frappe",
                            //                 //   qty: 1,
                            //                 //   price: 7.50,
                            //                 // ),
                            //               ],
                            //             ),
                            //           ),
                            //           Spacer(),
                            //           Container(
                            //             padding: EdgeInsets.only(bottom: 25),
                            //             child: Row(
                            //               mainAxisAlignment:
                            //                   MainAxisAlignment.spaceEvenly,
                            //               children: [
                            //                 Text(
                            //                   "Total",
                            //                   style: TextStyle(
                            //                       color: Colors.green,
                            //                       fontWeight: FontWeight.normal,
                            //                       fontSize: 22),
                            //                 ),
                            //                 SizedBox(
                            //                   width: 40,
                            //                 ),
                            //                 Row(
                            //                   children: [
                            //                     Container(
                            //                       margin:
                            //                           EdgeInsets.only(top: 4),
                            //                       child: Image.network(
                            //                         "https://www.libracoffee.io/img/icon-libra@3x.c0fc5777.png",
                            //                         width: 25,
                            //                       ),
                            //                     ),
                            //                     SizedBox(
                            //                       width: 10,
                            //                     ),
                            //                     Text(
                            //                       "18.85",
                            //                       style: TextStyle(
                            //                           color: Colors.green,
                            //                           fontWeight:
                            //                               FontWeight.normal,
                            //                           fontSize: 22),
                            //                     ),
                            //                   ],
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //     SizedBox(
                            //       height: 20,
                            //     ),
                            //     Container(
                            //       height: 70,
                            //       width: double.infinity,
                            //       decoration: BoxDecoration(
                            //         color: Colors.red,
                            //         boxShadow: [
                            //           BoxShadow(
                            //               color: Colors.black54,
                            //               blurRadius: 15.0,
                            //               offset: Offset(0.0, 0.75))
                            //         ],
                            //         borderRadius:
                            //             BorderRadius.all(Radius.circular(2)),
                            //       ),
                            //       child: Center(
                            //           child: Text(
                            //         "PAY (18.85)",
                            //         style: TextStyle(
                            //             color: Colors.white,
                            //             fontWeight: FontWeight.w600,
                            //             fontSize: 20),
                            //       )),
                            //     ),
                            //   ],
                            // ),
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
