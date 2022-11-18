import 'package:document_appmobile/app/helper/format_date_time.dart';
import 'package:document_appmobile/app/widget/app_dialogs.dart';
import 'package:document_appmobile/src/bussiness/folder/bloc/folder_bloc.dart';
import 'package:document_appmobile/src/data/model/folder/folder_recycle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/util/util.dart';
import '../../../app/widget/widget.dart';

class RecyclebinScreen extends StatefulWidget {
  const RecyclebinScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RecyclebinScreenState createState() => _RecyclebinScreenState();
}

class _RecyclebinScreenState extends State<RecyclebinScreen> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  bool _onScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        _scrollController!.position.extentAfter == 0) {
      context.read<FolderBloc>().add(LoadFolderRecycleBinEvent());
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Recycle Bin',
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: AppConstant.poppinsFont,
            fontSize: 17),
      )),
      body: BlocProvider(
        create: (context) => FolderBloc(RepositoryProvider.of(context))
          ..add(LoadFolderRecycleBinEvent()),
        child: BlocConsumer<FolderBloc, FolderState>(
          listener: (context, state) {
            if (state is FolderRecyleError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
            //  else if (state is FolderRecycleLoading) {
            //   ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(content: Text('Loading folder')));
            // } else if (state is FolderRecycleLoaded &&
            //     state.recycleBin.result!.isEmpty) {
            //   ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(content: Text('No more folder')));
            //   context.read<FolderBloc>().isFetching = false;
            // }
          },
          builder: (context, state) {
            if (state is FolderRecycleLoaded) {
              FolderRecycleReponse recycleBin = state.recycleBin;
              return RefreshIndicator(
                onRefresh: () async => context.read<FolderBloc>()
                  ..add(LoadFolderRecycleBinEvent()),
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) =>
                      _onScrollNotification(notification),
                  child: ListView.builder(
                      controller: _scrollController,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      primary: false,
                      itemCount: recycleBin.result!.length,
                      itemBuilder: (context, index) {
                        return CardList(
                          recycleBin: recycleBin.result![index],
                          onPressed: (r) {},
                        );
                      }),
                ),
              );
            }

            if (state is FolderRecyleError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<FolderBloc>()
                        ..isFetching = true
                        ..add(LoadFolderRecycleBinEvent());
                    },
                    icon: const Icon(Icons.refresh),
                  ),
                  const SizedBox(height: 15),
                  Text(state.error, textAlign: TextAlign.center),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class CardList extends StatelessWidget {
  const CardList({Key? key, required this.recycleBin, this.onPressed})
      : super(key: key);

  final ResultItemFolder recycleBin;
  final void Function(ResultItemFolder)? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => onPressed),
      child: Dismissible(
        key: ValueKey("dismissable-${recycleBin.id}"),
        direction: DismissDirection.endToStart,
        background: Container(
          color: HexColor.fromHex(AppColor.lightBackgroundColor).withOpacity(1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 100.0,
                height: double.infinity,
                child: Icon(
                  Icons.delete,
                  color: HexColor.fromHex(AppColor.primaryBtnColor),
                  size: 40.0,
                ),
              )
            ],
          ),
        ),
        confirmDismiss: (_) async {
          final result = showConfimation(
            context,
            title: "Are you sure?",
            content: " Do you want to delete ${recycleBin.type}?",
          );
          return result;
        },
        onDismissed: (_) {
          // context.read<FolderBloc>().add((note.id)Delete);
        },
        child: Card(
          child: ListTile(
            leading: iconType(recycleBin.type!),
            title: Text(recycleBin.name!),
            trailing: PopupMenuButton(
              icon: const Icon(Icons.more_vert_outlined),
              itemBuilder: (context) => [
                PopupMenuItem(
                    value: 1,
                    child: Row(
                      children: const [
                        Icon(Icons.delete_outline),
                        SizedBox(width: 10),
                        Text('Delete')
                      ],
                    )),
                PopupMenuItem(
                    value: 2,
                    child: Row(
                      children: const [
                        Icon(Icons.restore_outlined),
                        SizedBox(width: 10),
                        Text('Restore')
                      ],
                    )),
              ],
              offset: const Offset(0, 70),
              elevation: 2,
              onSelected: (value) {
                if (value == 1) {
                } else if (value == 2) {}
              },
            ),
            subtitle:
                Text(formatDateTime(recycleBin.lastModified!, hastime: true)),
          ),
        ),
      ),
    );
  }
}
