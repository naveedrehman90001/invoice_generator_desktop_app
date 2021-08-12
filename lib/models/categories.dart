
import 'package:hive/hive.dart';
import 'package:spicy_destop_invoic_app/models/subCategory.dart';

part 'categories.g.dart';

@HiveType(typeId: 0)
class Categories {
@HiveField(0)
 String categoryName;
@HiveField(1)
 String imageName;


 Categories({
   this.categoryName,
   this.imageName,
 }); 

}