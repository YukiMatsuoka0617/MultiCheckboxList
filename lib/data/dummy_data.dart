import 'package:flutter_application_multi_checkbox_list/models/category/category.dart';
import 'package:flutter_application_multi_checkbox_list/models/item/item.dart';

class DummyData {
  Category dummyCategory1 = Category(
    categoryName: 'Category1',
    itemList: [
      Item(
        itemName: 'Name1',
        checkList: List.filled(3, false),
      )
    ],
  );

  Category dummyCategory2 = Category(
    categoryName: 'Category2',
    itemList: [
      Item(
        itemName: 'Name2',
        checkList: List.filled(3, false),
      ),
      Item(
        itemName: 'Name3',
        checkList: List.filled(3, false),
      )
    ],
  );

  List<Category> getDummyData() {
    return [
      dummyCategory1,
      dummyCategory2,
    ];
  }
}
