import 'package:flutter/material.dart';

import '../util/util.dart';

class FolderGrid extends StatefulWidget {
  const FolderGrid({
    Key? key,
  }) : super(key: key);

  @override
  State<FolderGrid> createState() => _FolderGridState();
}

class _FolderGridState extends State<FolderGrid> {
  int? count;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      count = 4;
    } else {
      count = 2;
    }
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: count!,
      primary: false,
      crossAxisSpacing: 2,
      mainAxisSpacing: 3,
      childAspectRatio: 1.2,
      children: List.generate(20, (index) {
        return Card(
          // elevation: 20,
          color: Colors.transparent,
          shadowColor: Colors.transparent,
          child: Container(
            // width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.width,
            // child: Flexible(
            //   flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  '${AppImage.path}/${AppImage.iconWord}',
                  fit: BoxFit.cover,
                  height: 70,
                  width: 70,
                ),
                Container(
                  width: double.infinity,
                  // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'It Department Vietjet',
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: TextStyle(
                            fontSize: 14,
                            color: HexColor.fromHex(AppColor.blackTextColor),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            // ShowModalSearchName(context);
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            backgroundColor: Colors.red.withOpacity(0),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(2),
                                ),
                                side: BorderSide(color: Colors.transparent)),
                          ),
                          child: const Icon(
                            Icons.more_vert_outlined,
                            color: Colors.black45,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
          // ),
        );
      }),
    );
  }
}
