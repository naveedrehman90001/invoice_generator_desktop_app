import 'package:hive/hive.dart';

part 'subCategory.g.dart';

@HiveType(typeId: 2)
class SubCategory {
  @HiveField(0)
  String categoryName;
  @HiveField(1)
  String itemName;
  @HiveField(2)
  String itemImage;
  @HiveField(3)
  double price;
  @HiveField(4)
  int quantity;

  String key;

  SubCategory(
      {this.categoryName,
      this.itemName,
      this.itemImage,
      this.quantity,
      this.price,
      this.key
      });

  SubCategory.fromJson(Map<String, dynamic> json) {
    categoryName = json['category'].toString();
    itemName = json['itemName'].toString();
    itemImage = json['image'].toString();
    quantity = 1; //int.parse(json['quantity']);
    price = json['price'].toDouble();
  }
}
