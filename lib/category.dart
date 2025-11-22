import 'package:hive/hive.dart';
import 'item.dart';

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
