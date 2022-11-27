import 'dart:math';

import 'package:document_mobile/app/util/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/widget/folder_grid.dart';
import '../../../app/widget/widget.dart';
import '../../bussiness/folder/bloc/folder_bloc.dart';
import '../../data/model/folder/folder_item.dart';

class GridPrivateFolder extends StatefulWidget {
  const GridPrivateFolder({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GridPrivateFolderState createState() => _GridPrivateFolderState();
}

class _GridPrivateFolderState extends State<GridPrivateFolder> {
  bool isType = false;
  int? count;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FolderBloc(RepositoryProvider.of(context))
        ..add(LoadFolderPrivateEvent()),
      child: BlocListener<FolderBloc, FolderState>(
        listener: (context, state) {
          if (state is FolderPrivateErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: BlocBuilder<FolderBloc, FolderState>(
          builder: (context, state) {
            if (state is FolderPrivateLoadedState) {
              FolderItemResponse privateFolder = state.privateFolder;
              var newPrivateFolder = privateFolder.result!
                  .where(((element) => element.type == AppConstant.folder))
                  .toList();
              return RefreshIndicator(
                onRefresh: ((() async =>
                    context.read<FolderBloc>()..add(LoadFolderPrivateEvent()))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: <Widget>[
                            Container(
                                color: Colors.transparent,
                                padding: const EdgeInsets.only(top: 10),
                                // width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextSeachButton(
                                        onPressed: (() {
                                          // ShowModalSearchName(context);
                                        }),
                                        title: 'Name',
                                        iconData: Icons.arrow_upward_outlined),
                                    const TextSeachButton(
                                        title: 'Label',
                                        iconData: Icons.arrow_upward_outlined),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isType = !isType;
                                          });
                                        },
                                        icon: isType
                                            ? const Icon(
                                                Icons.grid_view_outlined)
                                            : const Icon(Icons.list_outlined)),
                                  ],
                                )),
                            (FolderGrid(
                              folderGrid: newPrivateFolder,
                            ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
