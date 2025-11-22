import 'package:flutter_application_multi_checkbox_list/models/category/category.dart';
import 'package:flutter_application_multi_checkbox_list/data/hive/hive_keys.dart';
import 'package:flutter_application_multi_checkbox_list/models/item/item.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    Hive.registerAdapter(CategoryAdapter());
    Hive.registerAdapter(ItemAdapter());

    await Hive.openBox<List>(HiveKeys.categoryBox);
  }

  void saveData(List<Category> data) {
    final box = Hive.box<List>(HiveKeys.categoryBox);
    box.put(HiveKeys.categoryKey, data);
  }

  List<dynamic>? getCategories() {
    final box = Hive.box<List>(HiveKeys.categoryBox);
    return box.get(HiveKeys.categoryKey);
  }
}
