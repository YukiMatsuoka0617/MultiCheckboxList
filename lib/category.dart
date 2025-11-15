import 'package:flutter_application_multi_checkbox_list/item.dart';

class Category {
  Category({
    required this.categoryName,
    required this.itemList,
  });

  String categoryName;
  List<Item> itemList;
}
