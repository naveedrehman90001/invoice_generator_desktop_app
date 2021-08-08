
import 'package:flutter/material.dart';

Widget itemTile(){
  return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(2)),
          boxShadow: [
            BoxShadow(
                color: Colors.black54,
                blurRadius: 15.0,
                offset: Offset(0.0, 0.75))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'product title',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 20),
          ),
          Text(
            'product description',
            style: TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.w600,
                fontSize: 14),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/espresso.51d468cc.jpg'))),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Image.network(
                        "https://www.libracoffee.io/img/icon-libra@3x.c0fc5777.png",
                        width: 25,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '2000',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.normal,
                          fontSize: 22),
                    ),
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    );
}