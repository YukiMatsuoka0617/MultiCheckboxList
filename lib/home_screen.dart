import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List<bool> dummyDate1 = List.filled(3, false);
List<bool> dummyDate2 = List.filled(3, false);
List<bool> dummyDate3 = List.filled(3, false);

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
          ExpansionTile(
            title: Text('Category1'),
            children: [
              ListTile(
                title: Text('Name1'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(3, (i) {
                    return Checkbox(
                      value: dummyDate1[i],
                      // onChanged: (value) {
                      //   setState(() {
                      //     dummyDate1[i] = value ?? false;
                      //   });
                      // },
                      onChanged: (i == 0 || dummyDate1[i - 1])
                          ? (value) {
                              setState(() {
                                dummyDate1[i] = value ?? false;
                                // 右側のチェックをオフにする処理（必要なら）
                                if (!dummyDate1[i]) {
                                  for (int j = i + 1;
                                      j < dummyDate1.length;
                                      j++) {
                                    dummyDate1[j] = false;
                                  }
                                }
                              });
                            }
                          : null,
                    );
                  }),
                ),
              ),
              TextButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('Add Item'),
                onPressed: () {},
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Category2'),
            children: [
              ListTile(
                title: Text('Name2'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(3, (i) {
                    return Checkbox(
                      value: dummyDate2[i],
                      onChanged: (value) {
                        setState(() {
                          dummyDate2[i] = value ?? false;
                        });
                      },
                    );
                  }),
                ),
              ),
              ListTile(
                title: Text('Name3'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(3, (i) {
                    return Checkbox(
                      value: dummyDate3[i],
                      onChanged: (value) {
                        setState(() {
                          dummyDate3[i] = value ?? false;
                        });
                      },
                    );
                  }),
                ),
              ),
              TextButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('Add Item'),
                onPressed: () {},
              ),
            ],
          ),
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
