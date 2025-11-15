import 'package:flutter/material.dart';
import 'package:flutter_application_multi_checkbox_list/item.dart';

class CategoryItemTile extends StatelessWidget {
  final Item item;
  final VoidCallback onChanged;

  const CategoryItemTile({
    super.key,
    required this.item,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.itemName),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(item.checkList.length, (i) {
          return Checkbox(
            value: item.checkList[i],
            onChanged: (i == 0 || item.checkList[i - 1])
                ? (value) {
                    item.checkList[i] = value ?? false;

                    // 後続を false に戻す処理
                    if (!item.checkList[i]) {
                      for (int j = i + 1; j < item.checkList.length; j++) {
                        item.checkList[j] = false;
                      }
                    }

                    onChanged(); // 親に通知（setStateは親側で呼ぶ）
                  }
                : null,
          );
        }),
      ),
    );
  }
}
