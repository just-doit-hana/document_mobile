import 'package:document_appmobile/src/bussiness/folder/bloc/folder_bloc.dart';
import 'package:document_appmobile/src/data/model/folder/folder_test_no.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      create: (context) =>
          FolderBloc(RepositoryProvider.of(context))..add(DomainEvent()),
      child: BlocListener<FolderBloc, FolderState>(
        listener: (context, state) {
          if (state is DomainErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: BlocBuilder<FolderBloc, FolderState>(
          builder: (context, state) {
            if (state is DomainLoaded) {
              List<TestNoMap> domain = state.domain!;
              return Scaffold(
                  appBar: AppBar(title: const Text('Recycle Bin')),
                  body: ListView.builder(
                      shrinkWrap: true,
                      itemCount: domain.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Text(domain[index].name!),
                            Text(domain[index].id!)
                          ],
                        );
                      }));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
