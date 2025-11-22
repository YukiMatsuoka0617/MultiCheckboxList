import 'package:hive/hive.dart';

part 'item.g.dart';

@HiveType(typeId: 1)
class Item {
  @HiveField(0)
  String itemName;

  @HiveField(1)
  List<bool> checkList;

  Item({
    required this.itemName,
    required this.checkList,
  });
}
