import 'package:document_mobile/app/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/widget/folder_grid.dart';
import '../../../app/widget/folder_list.dart';
import '../../../app/widget/widget.dart';
import '../../bussiness/folder/bloc/folder_bloc.dart';
import '../../data/model/folder/folder_item.dart';

class ShareFileScreen extends StatefulWidget {
  const ShareFileScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ShareFileScreenState createState() => _ShareFileScreenState();
}

class _ShareFileScreenState extends State<ShareFileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Share file', style: h4StyleLight),
        ),
        body: const ListShareFile());
  }
}

class ListShareFile extends StatefulWidget {
  const ListShareFile({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ListShareFileState createState() => _ListShareFileState();
}

class _ListShareFileState extends State<ListShareFile> {
  bool isType = false;
  int? count;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FolderBloc(RepositoryProvider.of(context))..add(ListShareFileEvent()),
      child: BlocListener<FolderBloc, FolderState>(
        listener: (context, state) {
          if (state is ListShareErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: BlocBuilder<FolderBloc, FolderState>(
          builder: (context, state) {
            if (state is ListShareLoadedState) {
              FolderItemResponse shareFile = state.sharefile;
              return RefreshIndicator(
                onRefresh: ((() async =>
                    context.read<FolderBloc>()..add(ListShareFileEvent()))),
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
                            isType
                                ? (FolderGrid(
                                    folderGrid: shareFile.result,
                                  ))
                                : (FolderList(
                                    folderList: shareFile,
                                  )),
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
