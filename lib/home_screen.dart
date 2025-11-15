import 'package:flutter/material.dart';
import 'package:flutter_application_multi_checkbox_list/category.dart';
import 'package:flutter_application_multi_checkbox_list/category_item_tile.dart';
import 'package:flutter_application_multi_checkbox_list/item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List<bool> dummyDate1 = List.filled(3, false);
List<bool> dummyDate2 = List.filled(3, false);
List<bool> dummyDate3 = List.filled(3, false);

List<Item> dummyCategory1ItemList = [
  Item(
    itemName: 'Name1',
    checkList: List.filled(3, false),
  )
];
Category dummyCategory1 = Category(
  categoryName: 'Category1',
  itemList: dummyCategory1ItemList,
);

List<Item> dummyCategory2ItemList = [
  Item(
    itemName: 'Name2',
    checkList: List.filled(3, false),
  ),
  Item(
    itemName: 'Name3',
    checkList: List.filled(3, false),
  )
];
Category dummyCategory2 = Category(
  categoryName: 'Category2',
  itemList: dummyCategory2ItemList,
);

List<Category> dummyCategoryList = [
  dummyCategory1,
  dummyCategory2,
];

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Multi Checkbox List'),
      ),
      body: ListView(
        children: [
          ...dummyCategoryList.map((category) {
            return ExpansionTile(
              title: Text(category.categoryName),
              children: [
                ...category.itemList.map((item) {
                  return CategoryItemTile(
                    item: item,
                    onChanged: () {
                      setState(() {});
                    },
                  );
                }),
                TextButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('Add Item'),
                  onPressed: () {
                    setState(() {});
                  },
                ),
              ],
            );
          }),
          Center(
            child: TextButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Add Category'),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
