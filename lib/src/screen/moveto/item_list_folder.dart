import 'package:flutter/material.dart';

import '../../../app/util/util.dart';
import '../../../app/widget/widget.dart';
import '../../data/model/folder/folder_result_folder.dart';

class ItemListFolder extends StatefulWidget {
  const ItemListFolder(
      {Key? key,
      required this.folderItem,
      required this.onPresedDetail,
      required this.isSelected})
      : super(key: key);
  final ValueChanged<bool> isSelected;
  final ResultItemFolder folderItem;
  final VoidCallback onPresedDetail;

  @override
  // ignore: library_private_types_in_public_api
  _ItemListFolderState createState() => _ItemListFolderState();
}

class _ItemListFolderState extends State<ItemListFolder> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        setState(() {
          isSelected = !isSelected;
          widget.isSelected(isSelected);
        });
      }),
      onDoubleTap: widget.onPresedDetail,
      child: Stack(
        children: <Widget>[
          Card(
            color: const Color.fromARGB(255, 175, 225, 249)
                .withOpacity(isSelected ? 0.9 : 0),
            shadowColor: Colors.black.withOpacity(isSelected ? 0.9 : 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    child: iconType(widget.folderItem.type!,
                        height: 70.0, width: 70.0)),
                SizedBox(
                  width: double.infinity,
                  // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Text(
                            widget.folderItem.name.toString(),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: TextStyle(
                              fontSize: 14,
                              color: HexColor.fromHex(AppColor.blackTextColor),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            // ),
          ),
          isSelected
              ? const Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.check_box_outlined,
                      color: Colors.redAccent,
                      size: 24,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
