import 'package:flutter/material.dart';

Row displayCartHeader() {
  return Row(
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
        child: InkWell(
          // onTap: () =>
          //     cartBox.clear(),
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
      ),
    ],
  );
}
