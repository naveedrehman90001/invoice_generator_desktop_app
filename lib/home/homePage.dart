import 'package:flutter/material.dart';
import 'package:spicy_destop_invoic_app/widgets/itemTile.dart';
import 'package:spicy_destop_invoic_app/widgets/menuListTile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                      margin: EdgeInsets.only(left: 10 , right: 10),
                      child: Text(
                                'Tables',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple,
                                ),
                              ),
                    ),

                    Container(
                      height: 150,
                      margin : EdgeInsets.only(left: 10 , right: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0,color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      // color: Colors.green,
                      child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1),
            itemCount: 5,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                margin: EdgeInsets.all(5.0),
                height: 40,
                width: 40,
                // color: Colors.purple,
              );
            })
                    ),

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

                    menuListTile()!,
                    menuListTile()!,
                    menuListTile()!,

                    // MenuListTile(
                    //   title: "Coffe",
                    //   active: true,
                    //   image:
                    //       "https://www.libracoffee.io/img/coffee.3fa69bf4.svg",
                    // ),
                    // MenuListTile(
                    //   title: "Breakfast",
                    //   active: false,
                    //   image:
                    //       "https://www.libracoffee.io/img/breakfast.7ffe88f4.svg",
                    // ),
                    // MenuListTile(
                    //   title: "Snack",
                    //   active: false,
                    //   image:
                    //       "https://www.libracoffee.io/img/munchies.f0cf6706.svg",
                    // ),
                    // MenuListTile(
                    //   title: "Fast food",
                    //   active: false,
                    //   image:
                    //       "https://www.libracoffee.io/img/sandwiches.8a4f25d0.svg",
                    // ),
                    // MenuListTile(
                    //   title: "Special Drinks",
                    //   active: false,
                    //   image:
                    //       "https://www.libracoffee.io/img/special-drinks.6151c892.svg",
                    // ),
                    Spacer(),
                    Container(
                      height: 130,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Color(0xFFFAFAFA)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/dotcoderlogo.png')),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Powered by DOTCODER"),
                          Text("Dev: Team"),
                        ],
                      ),
                    ),
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
                                        'Table 4',
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
                                    child: GridView.count(
                                      padding: EdgeInsets.all(10),
                                      crossAxisCount: 4,
                                      childAspectRatio: 0.8,
                                      children: [
                                        itemTile(),
                                        itemTile(),
                                        itemTile(), itemTile(),
                                        itemTile(),
                                        itemTile(),
                                        itemTile(),
                                        itemTile(), itemTile(),
                                        itemTile(),
                                        // ProductBox(
                                        //     title: "Expresso",
                                        //     description: "Blue Ridge Blend",
                                        //     image: "assets/images/espresso.51d468cc.jpg",
                                        //     price: 4.35),
                                        // ProductBox(
                                        //     title: "Choco Frappe",
                                        //     description: "Locally Roasted",
                                        //     image:
                                        //         "assets/images/choco_frappe.b233b3b8.jpg",
                                        //     price: 7.00),
                                        // ProductBox(
                                        //     title: "Caramel Frappe",
                                        //     description: "Decaf Colombia",
                                        //     image:
                                        //         "assets/images/caramel_frappe.ce2f41eb.jpg",
                                        //     price: 7.50),
                                        // ProductBox(
                                        //     title: "Kick Frappe",
                                        //     description: "Locally Roasted",
                                        //     image:
                                        //         "assets/images/kick_frappe.1e205836.jpg",
                                        //     price: 7.50),
                                        // ProductBox(
                                        //     title: "Cappuccino",
                                        //     description: "Decaf Colombia",
                                        //     image:
                                        //         "assets/images/cappuccino.2667eed1.jpg",
                                        //     price: 4.50),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Flexible(
                          flex: 5,
                          child: Container(
                            margin: EdgeInsets.only(right: 20, top: 25),
                            child: Column(
                              children: [
                                Container(
                                  height: 500,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF1F1F1),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black54,
                                          blurRadius: 15.0,
                                          offset: Offset(0.0, 0.75))
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2)),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(15),
                                        child: Text(
                                          "Checkout",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 20),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(15),
                                        color: Color(0xFFD1D1D1),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "Name",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 14),
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              "Qty",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 14),
                                            ),
                                            SizedBox(
                                              width: 40,
                                            ),
                                            Text(
                                              "Price",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 14),
                                            ),
                                            SizedBox(
                                              width: 80,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: ListView(
                                          shrinkWrap: true,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 15,
                                                  right: 15,
                                                  bottom: 5),
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color: Colors.grey,
                                                          width: .5))),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'My Product',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    '23',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 14),
                                                  ),
                                                  SizedBox(
                                                    width: 50,
                                                  ),
                                                  Text(
                                                    '4309',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 14),
                                                  ),
                                                  SizedBox(
                                                    width: 25,
                                                  ),
                                                  IconButton(
                                                      icon: Icon(Icons.delete),
                                                      onPressed: () {}),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // ProductCartTile(
                                            //   product: "Espresso",
                                            //   qty: 1,
                                            //   price: 4.35,
                                            // ),
                                            // ProductCartTile(
                                            //   product: "Choco Frappe",
                                            //   qty: 1,
                                            //   price: 7.00,
                                            // ),
                                            // ProductCartTile(
                                            //   product: "Caramel Frappe",
                                            //   qty: 1,
                                            //   price: 7.50,
                                            // ),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 25),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Total",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 22),
                                            ),
                                            SizedBox(
                                              width: 40,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 4),
                                                  child: Image.network(
                                                    "https://www.libracoffee.io/img/icon-libra@3x.c0fc5777.png",
                                                    width: 25,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "18.85",
                                                  style: TextStyle(
                                                      color: Colors.green,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 22),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 70,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black54,
                                          blurRadius: 15.0,
                                          offset: Offset(0.0, 0.75))
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2)),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "PAY (18.85)",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  )),
                                ),
                              ],
                            ),
                          ))
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
