import 'package:flutter_application_multi_checkbox_list/models/item/item.dart';
import 'package:hive/hive.dart';

part 'category.g.dart';

@HiveType(typeId: 0)
class Category {
  @HiveField(0)
  String categoryName;

  @HiveField(1)
  List<Item> itemList;

  Category({
    required this.categoryName,
    required this.itemList,
  });
}
