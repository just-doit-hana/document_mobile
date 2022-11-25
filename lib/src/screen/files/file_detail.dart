import 'package:document_mobile/app/animation/routes_animation.dart';
import 'package:document_mobile/app/helper/format_date_time.dart';
import 'package:document_mobile/app/widget/widget.dart';
import 'package:document_mobile/src/bussiness/file/bloc/file_bloc.dart';
import 'package:document_mobile/src/data/model/file/file_detail.dart';
import 'package:document_mobile/src/screen/user/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/util/util.dart';

class FileDetail extends StatelessWidget {
  const FileDetail({Key? key, required this.fileId}) : super(key: key);
  final String fileId;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: ((context) => FileBloc(RepositoryProvider.of(context))
              ..add(ViewDetailFileEvent(fileId: fileId))))
      ],
      child: BlocConsumer<FileBloc, FileState>(listener: (context, state) {
        if (state is ViewDetailFileErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      }, builder: (context, state) {
        if (state is ViewDetaiFilelLoadedState) {
          FileDetailResponse detail = state.fileDetailResponse;
          return Scaffold(
              body: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        pinned: true,
                        expandedHeight: 200.0,
                        flexibleSpace: FlexibleSpaceBar(
                            title: Text(
                              detail.fileDetail.name!,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: AppConstant.poppinsFont,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                            centerTitle: true,
                            background: iconType(detail.fileDetail.type!)),
                        elevation: 10.0,
                        automaticallyImplyLeading: true,
                        floating: true,
                        snap: true,
                      )
                    ];
                  },
                  body: Detail(
                    fileDetail: detail.fileDetail,
                  )));
        }
        return Container();
      }),
    );
  }
}

// ignore: must_be_immutable
class Detail extends StatelessWidget {
  Detail({Key? key, required this.fileDetail}) : super(key: key);
  FileDetails fileDetail;
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
                children: [
                  const Text(
                    'Type',
                    style: TextStyle(
                        fontSize: 16.0, fontFamily: AppConstant.poppinsFont),
                    // textAlign: TextAlign.left,
                  ),
                  // const SizedBox(
                  //   height: 3,
                  // ),

                  Text(
                    fileDetail.type!,
                    style: const TextStyle(
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
                    children: [
                      const Text(
                        'Size',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: AppConstant.poppinsFont),
                      ),
                      Text(
                        '${fileDetail.size!} Kb',
                        style: const TextStyle(
                            fontSize: 16.0,
                            fontFamily: AppConstant.poppinsFont),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Modified',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: AppConstant.poppinsFont),
                        ),
                        Text(
                          formatDateTime(fileDetail.lastModified!),
                          style: const TextStyle(
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
                        itemCount: fileDetail.tags?.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Chip(
                              backgroundColor: HexColor.fromHex(
                                  fileDetail.tags![index].hexColor!),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(2),
                                      topLeft: Radius.circular(2),
                                      topRight: Radius.circular(2),
                                      bottomRight: Radius.circular(2))),
                              label: Text(
                                fileDetail.tags![index].name!,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
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
                children: [
                  const Text(
                    'Owner',
                    style: TextStyle(
                        fontSize: 16.0, fontFamily: AppConstant.poppinsFont),
                  ),
                  Text(
                    fileDetail.ownerID!,
                    style: const TextStyle(
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
                children: [
                  const Text(
                    'Description',
                    style: TextStyle(
                        fontSize: 16.0, fontFamily: AppConstant.poppinsFont),
                  ),
                  Text(
                    fileDetail.description == null
                        ? 'There is not have description'
                        : fileDetail.description!,
                    style: const TextStyle(
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
                          itemCount: fileDetail.event!.length,
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
