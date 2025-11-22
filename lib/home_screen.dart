import 'package:flutter/material.dart';
import 'package:flutter_application_multi_checkbox_list/category.dart';
import 'package:flutter_application_multi_checkbox_list/category_item_tile.dart';
import 'package:flutter_application_multi_checkbox_list/data/dummy_data.dart';
import 'package:flutter_application_multi_checkbox_list/data/hive/hive_service.dart';
import 'package:flutter_application_multi_checkbox_list/item.dart';
import 'package:hive/hive.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

bool isDebug = false;

class _MyHomePageState extends State<MyHomePage> {
  List<Category> categoryList = [];
  late Box<List> categoryBox;

  final hive = HiveService();

  Future<String?> getNameFromDialog(String titleText, String hintText) async {
    final controller = TextEditingController();
    final name = await showDialog<String>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(titleText),
        content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: hintText)),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('キャンセル')),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, controller.text.trim()),
            child: const Text('追加'),
          ),
        ],
      ),
    );

    return name;
  }

  @override
  void initState() {
    super.initState();

    if (isDebug) {
      DummyData dummyData = DummyData();
      categoryList = dummyData.getDummyData();
    } else {
      final saved = hive.getCategories();
      if (saved != null) {
        categoryList = List<Category>.from(saved);
      }
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
                      setState(() {
                        hive.saveData(categoryList);
                      });
                    },
                  );
                }),
                TextButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('Add Item'),
                  onPressed: () async {
                    final itemName =
                        await getNameFromDialog('新しいアイテム', 'アイテム名');
                    if (itemName != null && itemName.isNotEmpty) {
                      setState(() {
                        category.itemList.add(Item(
                            itemName: itemName,
                            checkList: List.filled(3, false)));
                        hive.saveData(categoryList);
                      });
                    }
                  },
                ),
              ],
            );
          }),
          Center(
            child: TextButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Add Category'),
              onPressed: () async {
                final categoryName =
                    await getNameFromDialog('新しいカテゴリ', 'カテゴリ名');
                if (categoryName != null && categoryName.isNotEmpty) {
                  setState(() {
                    categoryList.add(
                        Category(categoryName: categoryName, itemList: []));
                    hive.saveData(categoryList);
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
