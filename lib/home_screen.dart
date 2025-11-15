import 'package:flutter/material.dart';
import 'package:flutter_application_multi_checkbox_list/category.dart';
import 'package:flutter_application_multi_checkbox_list/category_item_tile.dart';
import 'package:flutter_application_multi_checkbox_list/data/dummy_data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

bool isDebug = true;

// Category dummyCategory1 = Category(
//   categoryName: 'Category1',
//   itemList: [
//     Item(
//       itemName: 'Name1',
//       checkList: List.filled(3, false),
//     )
//   ],
// );

// Category dummyCategory2 = Category(
//   categoryName: 'Category2',
//   itemList: [
//     Item(
//       itemName: 'Name2',
//       checkList: List.filled(3, false),
//     ),
//     Item(
//       itemName: 'Name3',
//       checkList: List.filled(3, false),
//     )
//   ],
// );

// List<Category> dummyCategoryList = [
//   dummyCategory1,
//   dummyCategory2,
// ];

class _MyHomePageState extends State<MyHomePage> {
  late List<Category> categoryList = [];
  @override
  Widget build(BuildContext context) {
    if (isDebug) {
      DummyData dummyData = DummyData();
      categoryList = dummyData.getDummyData();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Multi Checkbox List'),
      ),
      body: ListView(
        children: [
          ...categoryList.map((category) {
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
