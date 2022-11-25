import 'package:document_mobile/app/helper/format_date_time.dart';
import 'package:document_mobile/src/bussiness/account/bloc/account_bloc.dart';
import 'package:document_mobile/src/data/model/folder/folder_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/util/util.dart';
import '../../bussiness/folder/bloc/folder_bloc.dart';
import '../../data/model/account/account.dart';

class FolderViewDetail extends StatelessWidget {
  const FolderViewDetail({Key? key, required this.folderId}) : super(key: key);
  final String folderId;

  Widget imgIcon(String iconImage, {double height = 28.0, width = 28.0}) {
    return Image.asset(
      '${AppImage.path}/$iconImage',
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: ((context) => FolderBloc(RepositoryProvider.of(context))
              ..add(ViewDetailFolderEvent(folderId: folderId)))),
        BlocProvider(
            create: ((context) => AccountBloc(RepositoryProvider.of(context))
              ..add(ListAccountEvent())))
      ],
      child: BlocConsumer<FolderBloc, FolderState>(listener: (context, state) {
        if (state is ViewDetailFolderErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      }, builder: (context, state) {
        if (state is ViewDetaiFolderlLoadedState) {
          FolderDetailResponse detail = state.folderDetailResponse;
          return Scaffold(
              body: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        pinned: true,
                        expandedHeight: 200.0,
                        backgroundColor: Colors.redAccent,
                        flexibleSpace: FlexibleSpaceBar(
                            title: Text(
                              detail.folderDeTail!.name!,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: AppConstant.poppinsFont,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                            centerTitle: true,
                            background: const Icon(
                              Icons.folder,
                              color: Colors.amberAccent,
                              size: 150,
                            )),
                        elevation: 10.0,
                        automaticallyImplyLeading: true,
                        floating: true,
                        snap: true,
                      )
                    ];
                  },
                  body: ViewDetail(
                    folderDetail: detail.folderDeTail!,
                  )));
        }
        return Container();
      }),
    );
  }
}

class ViewDetail extends StatelessWidget {
  ViewDetail({Key? key, required this.folderDetail}) : super(key: key);
  FolderDeTail folderDetail;
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [

              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Modified',
                      style: TextStyle(
                          fontSize: 16.0, fontFamily: AppConstant.poppinsFont),
                    ),
                    Text(
                      formatDateTime(folderDetail.lastModified),
                      style: const TextStyle(
                          fontSize: 16.0, fontFamily: AppConstant.poppinsFont),
                    )
                  ],
                ),
              ),
              //   ],
              // ),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<AccountBloc, AccountState>(
                builder: (context, state) {
                  if (state is AccountListLoadedState) {
                    List<Account> accounts = state.accountResponse;
                    final fullName = accounts.firstWhere(
                        (element) => element.id == folderDetail.ownerID);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Owner',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: AppConstant.poppinsFont),
                        ),
                        Text(fullName.fullName.toString())
                      ],
                    );
                  }
                  return Container();
                },
              ),
              const SizedBox(
                height: 10,
              ),
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
                          itemCount: folderDetail.event!.length,
                          padding: EdgeInsets.zero,
                          itemBuilder: ((context, index) {
                            return Card(
                              shadowColor: Colors.white.withOpacity(0.7),
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 24,
                                  child: Text(
                                      folderDetail.event![index].username!),
                                ),
                                subtitle:
                                    Text(folderDetail.event![index].content!),
                                title: folderDetail
                                        .event![index].username!.isNotEmpty
                                    ? Text(folderDetail.event![index].username!)
                                    : const Text('No FullName'),
                                trailing: Text(formatDateTime(
                                    folderDetail.event![index].createdAt!,
                                    hastime: false)),
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
