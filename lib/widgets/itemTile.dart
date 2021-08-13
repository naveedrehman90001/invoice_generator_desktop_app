
import 'package:flutter/material.dart';
import 'package:spicy_destop_invoic_app/models/subCategory.dart';

Widget itemTile(SubCategory subCategory){
  return Container(
      margin: EdgeInsets.all(10),
      // padding: EdgeInsets.all(10),
      height: 350,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
                color: Colors.black54,
                blurRadius: 15.0,
                offset: Offset(0.0, 0.75))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top:10,left:10,right:10),
            child: Text(
              subCategory.itemName,
              style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(bottom:10,left:10,right:10),
          //   child: Text(
          //     'product description',
          //     style: TextStyle(
          //         color: Colors.black45,
          //         fontWeight: FontWeight.w600,
          //         fontSize: 14),
          //   ),
          // ),

          // Center(
          //   child: Container(
          //         width: 100,
          //         height: 100,
          //         decoration: BoxDecoration(
          //             image: DecorationImage(image: AssetImage('assets/images/splogo.jpeg'))),
          //       ),
          // ),

              // Center(
              //   child:
              Spacer(),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Container(
                    //   margin: EdgeInsets.only(top: 4),
                    //   child: Image.network(
                    //     "https://www.libracoffee.io/img/icon-libra@3x.c0fc5777.png",
                    //     width: 25,
                    //   ),
                    // ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Text('RS '+
                        subCategory.price.toString(),
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.normal,
                            fontSize: 22),
                      ),
                    ),
                  ],
                ),
              // ),
          // Expanded(
          //     child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     SizedBox(
          //       height: 20,
          //     ),
          //     // Container(
          //     //   width: 130,
          //     //   height: 130,
          //     //   decoration: BoxDecoration(
          //     //       image: DecorationImage(image: AssetImage('assets/images/espresso.51d468cc.jpg'))),
          //     // ),
              
          //   ],
          // ))
        ],
      ),
    );
}