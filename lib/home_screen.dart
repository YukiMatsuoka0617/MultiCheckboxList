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

class _MyHomePageState extends State<MyHomePage> {
  List<Category> categoryList = [];

  @override
  void initState() {
    super.initState();
    if (isDebug) {
      DummyData dummyData = DummyData();
      categoryList = dummyData.getDummyData();
    }
  }

  @override
  Widget build(BuildContext context) {
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
