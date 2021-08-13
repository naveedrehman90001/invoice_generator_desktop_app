import 'package:flutter/material.dart';

Widget menuListTile({String title,int myIndex,int selectedIndex}) {


  return Container(
    margin: EdgeInsets.only(bottom: 10),
    child: Row(
      children: [
        SizedBox(
          width: 20,
        ),
        // SvgPicture.network(image!),
        Container(
          height:40,
          width : 40,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/pizzaIcon.jpg'),
            )
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          padding: EdgeInsets.only(bottom: 5, right: 20),
          // margin: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
              border: (myIndex==selectedIndex)
                  ? Border(bottom: BorderSide(color: Colors.green, width: 5))
                  : Border()),
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 16),
          ),
        ),
      ],
    ),
  );
}
