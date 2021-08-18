import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:spicy_destop_invoic_app/models/cartModel.dart';
import 'package:spicy_destop_invoic_app/utils/data.dart';


Widget displayCartRow({CartModel cartModel,Function increaseQty,Function decreaseQty,Function delItem}) {
  return Container(
      margin: EdgeInsets.only(left: 10),
      height: 40,
      child: Row(
        children: [
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Container(
              // color: Colors.amber,
              child: Text(cartModel.item),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Container(
              margin: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: InkWell(
                      onTap: decreaseQty,
                      child: Container(
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                        ),
                        child: Icon(
                          Icons.remove,
                          size: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(cartModel.quantity.toString()),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: InkWell(
                      onTap: increaseQty,
                      child: Container(
                        height: double.infinity,
                        color: Colors.purple,
                        child: Icon(
                          Icons.add,
                          size: 12,
                          color: Colors.white,
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
              child: Text(cartModel.price.toString()),
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: InkWell(
              onTap: delItem,//() => myBox.delete(cartModel.key),
              child: Container(
                // color: Colors.amber,

                child: Icon(
                  Icons.delete_forever,
                  size: 18,
                ),
              ),
            ),
          )
        ],
      ));
}
