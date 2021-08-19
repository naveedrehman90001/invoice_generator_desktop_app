import 'package:hive/hive.dart';
part 'cartModel.g.dart';



@HiveType(typeId: 1)
class CartModel {
@HiveField(0)
  String item;
@HiveField(1)
  String img;
@HiveField(2)
  int quantity;
@HiveField(3)
  double price;
@HiveField(4)
  int tableNo;

  int key;

  CartModel({this.item,this.img,this.price,this.quantity,this.tableNo,this.key});
}