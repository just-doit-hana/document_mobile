// import 'package:document_mobile/src/data/model/folder/folder_item.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../app/helper/format_date_time.dart';
// import '../../../app/util/util.dart';
// import '../../../app/widget/app_dialogs.dart';
// import '../../../app/widget/widget.dart';
// import '../../bussiness/folder/bloc/folder_bloc.dart';
// import '../../data/model/folder/folder_result_folder.dart';
// import 'bloc/infiniscroll_bloc.dart';
// import 'bottom_loader.dart';

// class InfinationScroll extends StatefulWidget {
//   const InfinationScroll({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _InfinationScrollState createState() => _InfinationScrollState();
// }

// class _InfinationScrollState extends State<InfinationScroll> {
//   final _scrollController = ScrollController();

//   ResultItemFolder? test;
//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(_onScroll);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => InfiniscrollBloc(RepositoryProvider.of(context))
//         ..add(RecycleBinFetched(page:1,hasReachedMax: false, folderItemResponse:   )),
//       child: BlocConsumer<InfiniscrollBloc, InfiniscrollState>(
//         listener: (context, state) {
//           if (!state && _isBottom) {
//             context.read<InfiniscrollBloc>().add(RecycleBinFetched());
//           }
//         },
//         builder: (context, state) {
//           FolderItemResponse test = state;

//           if (state is InfinitiScrollFailure) {
//             return const Center(child: Text('failed to fetch recycle bin'));
//           } else if (state is InfinitiScrollSuccess) {
//             if (state.recleBin.result!.isEmpty) {
//               return const Center(child: Text('no recycle bin'));
//             }
//             return Scaffold(
//                 appBar: AppBar(
//                     title: Text(
//                   'Recycle Bin',
//                   style: h4StyleLight,
//                 )),
//                 body: GridView.builder(
//                     itemCount: state.hasReachedMax
//                         ? test.result!.length + 1
//                         : test.result!.length + 2,
//                     controller: _scrollController,
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2),
//                     itemBuilder: (BuildContext context, int index) {
//                       return index >= test.result!.length
//                           ? const BottomLoader()
//                           : Text('Test${test.result![index].name}');
//                     }));
//           }
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _scrollController.dispose();
//   }

//   void _onScroll() {
//     if (_isBottom) {
//       context.read<InfiniscrollBloc>().add(RecycleBinFetched());
//     }
//   }

//   bool get _isBottom {
//     if (!_scrollController.hasClients) return false;
//     final maxScroll = _scrollController.position.maxScrollExtent;
//     final double height = MediaQuery.of(context).size.height;
//     final currentScroll = _scrollController.offset;
//     return currentScroll >= (maxScroll * 0.9);
//   }
// }

// class CardList extends StatelessWidget {
//   const CardList({Key? key, required this.recycleBin, this.onPressed})
//       : super(key: key);

//   final ResultItemFolder recycleBin;
//   final void Function(ResultItemFolder)? onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (() => onPressed),
//       child: Dismissible(
//         key: ValueKey("dismissable-${recycleBin.id}"),
//         direction: DismissDirection.endToStart,
//         background: Container(
//           color: HexColor.fromHex(AppColor.lightBackgroundColor).withOpacity(1),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               SizedBox(
//                 width: 100.0,
//                 height: double.infinity,
//                 child: Icon(
//                   Icons.delete,
//                   color: HexColor.fromHex(AppColor.primaryBtnColor),
//                   size: 40.0,
//                 ),
//               )
//             ],
//           ),
//         ),
//         confirmDismiss: (_) async {
//           final result = showConfimation(context,
//               title: "Are you sure?",
//               content: " Do you want to delete ${recycleBin.name}?",
//               nameBtn: 'Delete');
//           return result;
//         },
//         onDismissed: (_) {
//           if (recycleBin.type == AppConstant.folder) {
//             context
//                 .read<FolderBloc>()
//                 .add(DeleteRecycleBinFolderEvent(id: recycleBin.id!));
//             context.read<FolderBloc>().add(LoadFolderRecycleBinEvent(page: 1));
//           } else {
//             context
//                 .read<FolderBloc>()
//                 .add(DeleteRecycleBinFileEvent(id: recycleBin.id!));
//             context.read<FolderBloc>().add(LoadFolderRecycleBinEvent(page: 1));
//           }
//         },
//         child: Card(
//           child: ListTile(
//             leading: iconType(recycleBin.type!),
//             title: Text(recycleBin.name!),
//             trailing: PopupMenuButton(
//               icon: const Icon(Icons.more_vert_outlined),
//               itemBuilder: (context) => [
//                 PopupMenuItem(
//                     value: 1,
//                     child: Row(
//                       children: const [
//                         Icon(Icons.delete_outline),
//                         SizedBox(width: 10),
//                         Text('Delete')
//                       ],
//                     )),
//                 PopupMenuItem(
//                     value: 2,
//                     child: Row(
//                       children: const [
//                         Icon(Icons.restore_outlined),
//                         SizedBox(width: 10),
//                         Text('Restore')
//                       ],
//                     )),
//               ],
//               offset: const Offset(0, 70),
//               elevation: 2,
//               onSelected: (value) {
//                 if (value == 1) {
//                   if (recycleBin.type == AppConstant.folder) {
//                     context
//                         .read<FolderBloc>()
//                         .add(DeleteRecycleBinFolderEvent(id: recycleBin.id!));
//                     context
//                         .read<FolderBloc>()
//                         .add(LoadFolderRecycleBinEvent(page: 1));
//                   } else {
//                     context
//                         .read<FolderBloc>()
//                         .add(DeleteRecycleBinFileEvent(id: recycleBin.id!));
//                     context
//                         .read<FolderBloc>()
//                         .add(LoadFolderRecycleBinEvent(page: 1));
//                   }
//                 } else if (value == 2) {
//                   if (recycleBin.type == AppConstant.folder) {
//                     context
//                         .read<FolderBloc>()
//                         .add(RestoreRecycleBinFolderEvent(id: recycleBin.id!));
//                     context
//                         .read<FolderBloc>()
//                         .add(LoadFolderRecycleBinEvent(page: 1));
//                   } else {
//                     context
//                         .read<FolderBloc>()
//                         .add(RestoreRecycleBinFileEvent(id: recycleBin.id!));
//                     context
//                         .read<FolderBloc>()
//                         .add(LoadFolderRecycleBinEvent(page: 1));
//                   }
//                 }
//               },
//             ),
//             subtitle:
//                 Text(formatDateTime(recycleBin.lastModified!, hastime: true)),
//           ),
//         ),
//       ),
//     );
//   }
// }
