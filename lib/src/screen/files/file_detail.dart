import 'package:document_mobile/app/animation/routes_animation.dart';
import 'package:document_mobile/src/screen/user/user_screen.dart';
import 'package:flutter/material.dart';

import '../../../app/util/util.dart';

class FileDetail extends StatefulWidget {
  const FileDetail({Key? key}) : super(key: key);

  @override
  State<FileDetail> createState() => _FileDetailState();
}

class _FileDetailState extends State<FileDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.white,
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                const SliverAppBar(
                  pinned: true,
                  expandedHeight: 200.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      'File test case document',
                      style: TextStyle(
                          fontFamily: AppConstant.poppinsFont,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    centerTitle: true,
                    background: Icon(
                      Icons.folder,
                      size: 100,
                    ),
                  ),
                  elevation: 10.0,
                  automaticallyImplyLeading: true,
                  floating: true,
                  snap: true,
                )
              ];
            },
            body: const Detail()));
  }
}

class Detail extends StatelessWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8),
      itemCount: 1,
      scrollDirection: Axis.vertical,
      itemBuilder: ((context, index) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Type',
                    style: TextStyle(
                        fontSize: 16.0, fontFamily: AppConstant.poppinsFont),
                    // textAlign: TextAlign.left,
                  ),
                  // const SizedBox(
                  //   height: 3,
                  // ),
                  Text(
                    'Doc',
                    style: TextStyle(
                        fontSize: 16.0, fontFamily: AppConstant.poppinsFont),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Size',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: AppConstant.poppinsFont),
                      ),
                      Text(
                        '22.82 Kb',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: AppConstant.poppinsFont),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Modified',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: AppConstant.poppinsFont),
                        ),
                        Text(
                          'Yesterday, 20:38',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: AppConstant.poppinsFont),
                        )
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tags',
                    style: TextStyle(
                        fontSize: 16.0, fontFamily: AppConstant.poppinsFont),
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          return const Padding(
                            padding: EdgeInsets.only(right: 4),
                            child: Chip(
                              backgroundColor: Colors.amberAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(2),
                                      topLeft: Radius.circular(2),
                                      topRight: Radius.circular(2),
                                      bottomRight: Radius.circular(2))),
                              label: Text(
                                'Text case',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: AppConstant.poppinsFont),
                              ),
                            ),
                          );
                        })),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Owner',
                    style: TextStyle(
                        fontSize: 16.0, fontFamily: AppConstant.poppinsFont),
                  ),
                  Text(
                    'Tran Quang Huy',
                    style: TextStyle(
                        fontSize: 16.0, fontFamily: AppConstant.poppinsFont),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Description',
                    style: TextStyle(
                        fontSize: 16.0, fontFamily: AppConstant.poppinsFont),
                  ),
                  Text(
                    'There is not have description',
                    style: TextStyle(
                        fontSize: 16.0, fontFamily: AppConstant.poppinsFont),
                  )
                ],
              ),

              // All List Member
              Padding(
                  padding: const EdgeInsets.only(top: 18, bottom: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Member in file',
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: AppConstant.poppinsFont,
                                fontWeight: FontWeight.w500),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).push(CustomRoutesPage(
                                    widget: const UserAccessScreen()));
                              },
                              icon: const Icon(Icons.navigate_next_outlined))
                        ],
                      ),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 24,
                              child: Text('Huytq'),
                            ),
                            const VerticalDivider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                height: 50,
                                child: ListView.builder(
                                    itemCount: 10,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: ((context, index) {
                                      return const CircleAvatar(
                                        backgroundColor: Colors.amber,
                                        radius: 24,
                                        child: Text('Huytq'),
                                      );
                                    })),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 18, bottom: 10),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Activity',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: AppConstant.poppinsFont,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      height: 200,
                      padding: const EdgeInsets.only(top: 10),
                      // color: Colors.red,
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemBuilder: ((context, index) {
                            return Card(
                              shadowColor: Colors.white.withOpacity(0.7),
                              child: const ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 24,
                                  child: Text('Hytq'),
                                ),
                                subtitle: Text('create file'),
                                title: Text('Tran Quang huy'),
                                trailing: Text('Oct 8, 2022'),
                              ),
                            );
                          })),
                    )
                  ],
                ),
              ),

              // Version
              Padding(
                padding: const EdgeInsets.only(top: 18, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Version',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: AppConstant.poppinsFont,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      height: 200,
                      padding: const EdgeInsets.only(top: 10),
                      // color: Colors.red,
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: 10,
                          itemBuilder: ((context, index) {
                            return Card(
                              shadowColor: Colors.white.withOpacity(0.7),
                              child: const ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 24,
                                  child: Text('Hytq'),
                                ),
                                subtitle: Text('Oct 8, 2022'),
                                title: Text('report'),
                                trailing: Icon(Icons.download_outlined),
                              ),
                            );
                          })),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
