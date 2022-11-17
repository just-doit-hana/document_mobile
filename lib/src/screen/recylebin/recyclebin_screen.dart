import 'package:document_appmobile/src/bussiness/folder/bloc/folder_bloc.dart';
import 'package:document_appmobile/src/data/model/folder/folder_item.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FolderBloc(RepositoryProvider.of(context))
        ..add(LoadFolderRecycleBinEvent()),
      child: BlocListener<FolderBloc, FolderState>(
        listener: (context, state) {
          if (state is FolderRecyleError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: BlocBuilder<FolderBloc, FolderState>(
          builder: (context, state) {
            if (state is FolderRecycleLoaded) {
              // List<TestNoMap> domain = state.domain!;
              FolderItemResponse recycleBin = state.recycleBin;
              return Scaffold(
                  appBar: AppBar(
                      title: const Text(
                    'Recycle Bin',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: AppConstant.poppinsFont,
                        fontSize: 17),
                  )),
                  body: Card(
                    child: ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: recycleBin.result.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: iconType(recycleBin.result[index].type!,
                                height: 10, width: 10),
                            title: Text(recycleBin.result[index].name!),
                            trailing: const Icon(Icons.more_vert_outlined),
                          );
                        }),
                  ));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
