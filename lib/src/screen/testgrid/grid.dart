import 'package:flutter/material.dart';

import 'home_grid.dart';

class GridItem extends StatefulWidget {
  @override
  // ignore: overridden_fields
  final Key key;
  final Item item;
  final ValueChanged<bool> isSelected;

  const GridItem({
    required this.item,
    required this.isSelected,
    required this.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.isSelected(isSelected);
        });
      },
      child: Stack(
        children: <Widget>[
          Image.asset(
            widget.item.imageUrl,
            color: Colors.black.withOpacity(isSelected ? 0.9 : 0),
            colorBlendMode: BlendMode.color,
          ),
          isSelected
              ? const Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.blue,
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
