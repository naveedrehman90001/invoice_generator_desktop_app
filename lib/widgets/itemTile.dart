
import 'package:flutter/material.dart';
import 'package:spicy_destop_invoic_app/models/subCategory.dart';

Widget itemTile({SubCategory subCategory,Function delete,Function edit}){
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
        Row(children: [
          IconButton(icon: Icon(Icons.edit),
          iconSize: 30,
           onPressed: edit
           ),
            IconButton(icon: Icon(Icons.delete),
          iconSize: 30,
           onPressed: delete
           ),
        ],)
          
        ],
      ),
    );
}