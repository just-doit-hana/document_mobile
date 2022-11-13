import 'package:document_appmobile/app/animation/routes_animation.dart';
import 'package:document_appmobile/app/helper/format_date_time.dart';
import 'package:document_appmobile/app/util/util.dart';
import 'package:document_appmobile/src/bussiness/folder/bloc/folder_bloc.dart';
import 'package:document_appmobile/src/data/model/folder/folder.dart';
import 'package:document_appmobile/src/screen/folder/folder_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/widget/widget.dart';
import '../../src/data/repository/folder/folder_repo.dart';

// ignore: must_be_immutable
class FolderList extends StatefulWidget {
  const FolderList({Key? key, required this.folder}) : super(key: key);
  final Result folder;
  @override
  // ignore: library_private_types_in_public_api
  _FolderListState createState() => _FolderListState();
}

class _FolderListState extends State<FolderList> {
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
    return BlocProvider(
        create: (context) =>
            FolderBloc((RepositoryProvider.of<FolderRepository>(context)))
              ..add(LoadFolderPublicEvent()),
        child: BlocListener<FolderBloc, FolderState>(
          listener: (context, state) {
            if (state is FolderErrorState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          child: BlocBuilder<FolderBloc, FolderState>(
            builder: (context, state) {
              if (state is FolderLoadingState) {
                return _buildLoading();
              }
              if (state is FolderLoadedState) {
                Result folderList = state.folder;
                return RefreshIndicator(
                  onRefresh: (() async =>
                      context.read<FolderBloc>().add(LoadFolderPublicEvent())),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: folderList.subFolders.length,
                      itemBuilder: ((context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onDoubleTap: () {
                                Navigator.of(context).push(CustomRoutesPage(
                                    widget: FolderDetail(
                                  id: index,
                                  subFolders: folderList,
                                )));
                              },
                              child: Card(
                                  child: ListTile(
                                      title: Text(
                                          folderList.subFolders[index].name),
                                      subtitle: Text(formatDateTime(
                                          '2022-10-27T09:17:46.453697',
                                          hastime: false)),
                                      leading: imgIcon(AppImage.iconFolder),
                                      trailing: ElevatedButton(
                                          onPressed: () {
                                            ShowModalSearchName(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            elevation: 0.0,
                                            backgroundColor:
                                                Colors.red.withOpacity(0),
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(2),
                                                ),
                                                side: BorderSide(
                                                    color: Colors.white)),
                                          ),
                                          child: const Icon(
                                            Icons.more_vert_outlined,
                                            color: Colors.black54,
                                          )))),
                            ),
                          ],
                        );
                      })),
                );
              }
              return Container();
            },
          ),
        ));
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

  // ignore: non_constant_identifier_names
  Future<dynamic> ShowModalSearchName(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          return Container(
              height: MediaQuery.of(context).size.height * 0.32,
              decoration: BoxDecoration(
                  color: HexColor.fromHex(
                      AppColor.lightBackgroundColor), // or some other color
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 34, top: 10, bottom: 8),
                      child: Text(
                        'Sort by',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: AppConstant.poppinsFont,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: HexColor.fromHex(AppColor.blackTextColor)),
                      ),
                    ),
                  ),
                  Divider(
                    height: 4,
                    color: HexColor.fromHex(AppColor.grayTextColor),
                  ),
                  const AppBtnSearchModal(
                      title: 'Name', icon: Icons.arrow_upward_outlined),
                  const AppBtnSearchModal(
                      title: 'Last Modified',
                      icon: Icons.arrow_upward_outlined),
                  const AppBtnSearchModal(
                      title: 'Label', icon: Icons.arrow_upward_outlined),
                  const AppBtnSearchModal(
                      title: 'Member', icon: Icons.arrow_upward_outlined),
                ],
              ));
        });
  }
}
