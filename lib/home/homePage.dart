
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

  String selectedCategory;
  double totalPrice;

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

  @override
  void initState() {
  
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
          child:
              //  ValueListenableBuilder<Box<Categories>>(
              //             valueListenable:
              //                 Hive.box<Categories>(categoryBox).listenable(),
              //             builder: (context, categBox, _) {
              //               var cate = categBox.values.toList().cast<Categories>();
              //               return
ValueListenableBuilder<Box<CartModel>>(
                                valueListenable:
                                    Hive.box<CartModel>(cartBox).listenable(),
                                builder: (context, cartBox, _) {
                                  var allCart = cartBox.values.toList().cast<CartModel>();
                                  List<CartModel> currentCart=[];
                                  if(selectedTable!=null){
                                    currentCart = allCart.where((element) =>(element.tableNo==selectedTable)).toList();
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
                                  print(allCart.length);
                                  return 
              Row(
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
                    Container(
                        height: MediaQuery.of(context).size.height * 0.38,
                        //         ValueListenableBuilder<Box<Categories>>(
                        // valueListenable:
                        //     Hive.box<Categories>(categoryBox).listenable(),
                        // builder: (context, categBox, _) {
                        //   var cate = categBox.values.toList().cast<Categories>();
                        //   return
                        child: ValueListenableBuilder<Box<Categories>>(
                            valueListenable:
                                Hive.box<Categories>(categoryBox).listenable(),
                            builder: (context, categBox, _) {
                              var cate =
                                  categBox.values.toList().cast<Categories>();
                              return (categBox == null)
                                  ? InkWell(
                                      onTap: () {
                                        Categories cat = Categories(
                                          categoryName: 'Pizza',
                                          imageName: '',
                                          // subcatery: [],
                                        );
                                        categBox.add(cat);
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
                                                    categoryName: 'Burger',
                                                    imageName: '',
                                                    // subcatery: [],
                                                  );
                                                  categBox.add(cat);
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
                                                },
                                                child: menuListTile(
                                                  title:
                                                      cate[index].categoryName,
                                                ),
                                              );
                                      },
                                    );
                            })),
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
                                    child: ValueListenableBuilder<
                                            Box<SubCategory>>(
                                        valueListenable: Hive.box<SubCategory>(
                                                subCategoryBox)
                                            .listenable(),
                                        builder: (context, subCatBox, _) {
                                          List<SubCategory> subCate = subCatBox
                                              .values
                                              .toList()
                                              .cast<SubCategory>();
                                          List<SubCategory> fileredSub = [];
                                          if (selectedCategory != null) {
                                            fileredSub = subCate
                                                .where((element) => (element
                                                    .categoryName
                                                    .contains(
                                                        selectedCategory)))
                                                .toList();
                                          }
                                          return Container(
                                            child: (selectedCategory == null)
                                                ? Center(
                                                    child: Text(
                                                      'Category not Selected',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  )
                                                : GridView.builder(
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 4,
                                                      childAspectRatio: 0.90,
                                                    ),
                                                    itemCount:
                                                        fileredSub.length + 1,
                                                    // cate[selectedCategoryIndex].subcatery.length + 1,
                                                    itemBuilder: (_, index) {
                                                      return (fileredSub
                                                                  .length ==
                                                              index)
                                                          ? InkWell(
                                                              onTap: () async {
                                                             

                                                                SubCategory
                                                                    sub =
                                                                    SubCategory(
                                                                  categoryName:
                                                                      selectedCategory,
                                                                  itemImage: "",
                                                                  itemName:
                                                                      "add in Burger",
                                                                  price: 700,
                                                                  quantity: 1,
                                                                );
                                                                subCatBox
                                                                    .add(sub);
                                                              },
                                                              child: Container(
                                                                color: Colors
                                                                    .green,
                                                                child: Icon(
                                                                    Icons.add),
                                                              ),
                                                            )
                                                          : InkWell(
                                                            onTap: (){
                                                              CartModel mycart ;
                                                              (selectedTable==null)?
                                                              {
                                                                print('error'),
                                                            // Get.snackbar('Error', 'Select Table first',backgroundColor: Colors.redAccent,snackPosition:SnackPosition.BOTTOM),
                                                              }:{
 mycart =    CartModel(
   img: fileredSub[index].itemImage,
   item: fileredSub[index].itemName,
   price: fileredSub[index].price,
   quantity: fileredSub[index].quantity,
   tableNo: selectedTable, ),
                              cartBox.add(mycart),
                                                              };
                                                             
                                                            },
                                                              child: itemTile(
                                                                  fileredSub[
                                                                      index]));
                                                    }),
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
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  child: Text(
                                                    'Name',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                fit: FlexFit.tight,
                                                child: InkWell(
                                                  onTap: ()=>cartBox.clear(),
                                                  child: Container(
                                                    child: Text(
                                                      'Del',
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
                                        flex: 8,
                                        fit: FlexFit.tight,
                                        child: Container(
                                          color: Colors.white,
                                          child: ListView.separated(
                                            separatorBuilder:
                                                (context, index) => Divider(),
                                            itemCount: allCart.length,
                                            itemBuilder: (context, index) {
                                              print("length in list view ${allCart.length}");
                                              print(allCart[index].tableNo);
                                              return 
                                            

                                              (selectedTable==null)?
                                              SizedBox():
                                              
                                              (allCart[index].tableNo == selectedTable)?
                                              // Text(allCart[index].tableNo.toString()+allCart[index].price.toString()+allCart[index].quantity.toString()+allCart[index].item+allCart[index].img)
                                              Container(
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
                                                            Text(allCart[index].item),
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
                                                                  if(allCart[index].quantity>1){

                                                                  
                                                                  CartModel thisCart = CartModel(
                                                                  img: allCart[index].img,
                                                                  tableNo: allCart[index].tableNo,
                                                                  item: allCart[index].item,
                                                                  price: allCart[index].price,
                                                                  quantity: allCart[index].quantity -1
                                                                  );
                                                                cartBox.putAt(index, thisCart);
                                                                  }
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
                                                                      allCart[index].quantity.toString()),
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              flex: 1,
                                                              fit: FlexFit
                                                                  .tight,
                                                              child: InkWell(
                                                                onTap: () {
                                                                  CartModel thisCart = CartModel(
                                                                  img: allCart[index].img,
                                                                  tableNo: allCart[index].tableNo,
                                                                  item: allCart[index].item,
                                                                  price: allCart[index].price,
                                                                  quantity: allCart[index].quantity +1
                                                                  );
                                                                cartBox.putAt(index, thisCart);
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
                                                        child: Text(allCart[index].price.toString()),
                                                      ),
                                                    ),
                                                    Flexible(
                                                      flex: 1,
                                                      fit: FlexFit.tight,
                                                      child: InkWell(
                                                        onTap: ()=>cartBox.deleteAt(index),
                                                        child: Container(
                                                          // color: Colors.amber,

                                                          child: Icon(
                                                            Icons
                                                                .delete_forever,
                                                            size: 18,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ))
                                                :SizedBox();
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
                                                    child: Text(totalPrice.toString(),
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

  
}
