import 'package:flutter/material.dart';

import 'grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Item> itemList;
  late List<Item> selectedList;

  @override
  void initState() {
    loadList();
    super.initState();
  }

  loadList() {
    itemList = [];
    selectedList = [];
    itemList.add(Item("assets/pringles.png", 1));
    itemList.add(Item("assets/pringles.png", 2));
    itemList.add(Item("assets/pringles.png", 3));
    itemList.add(Item("assets/pringles.png", 4));
    itemList.add(Item("assets/pringles.png", 5));
    itemList.add(Item("assets/pringles.png", 6));
    itemList.add(Item("assets/pringles.png", 7));
    itemList.add(Item("assets/pringles.png", 8));
    itemList.add(Item("assets/pringles.png", 9));
    itemList.add(Item("assets/pringles.png", 10));
    itemList.add(Item("assets/pringles.png", 11));
    itemList.add(Item("assets/pringles.png", 12));
    itemList.add(Item("assets/pringles.png", 13));
    itemList.add(Item("assets/pringles.png", 14));
    itemList.add(Item("assets/pringles.png", 15));
    itemList.add(Item("assets/pringles.png", 16));
    itemList.add(Item("assets/pringles.png", 17));
    itemList.add(Item("assets/pringles.png", 18));
    itemList.add(Item("assets/pringles.png", 19));
    itemList.add(Item("assets/pringles.png", 20));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: GridView.builder(
          itemCount: itemList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 0.56,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2),
          itemBuilder: (context, index) {
            return GridItem(
                item: itemList[index],
                isSelected: (bool value) {
                  setState(() {
                    if (value) {
                      selectedList.add(itemList[index]);
                    } else {
                      selectedList.remove(itemList[index]);
                    }
                  });
                },
                key: Key(itemList[index].rank.toString()));
          }),
    );
  }

  getAppBar() {
    return AppBar(
      title: Text(selectedList.isEmpty
          ? "Multi Selection"
          : "${selectedList.length} item selected"),
      actions: <Widget>[
        selectedList.isEmpty
            ? Container()
            : InkWell(
                onTap: () {
                  setState(() {
                    for (int i = 0; i < selectedList.length; i++) {
                      itemList.remove(selectedList[i]);
                    }
                    selectedList = [];
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.delete),
                ))
      ],
    );
  }
}

class Item {
  String imageUrl;
  int rank;

  Item(this.imageUrl, this.rank);
}
