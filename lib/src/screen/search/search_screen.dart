// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:document_mobile/app/widget/folder_list.dart';
import 'package:document_mobile/src/bussiness/folder/bloc/folder_bloc.dart';

class FolderSearch extends SearchDelegate<List> {
  String? searchText;
  final String? hintText;
  FolderSearch(this.hintText) : super(searchFieldLabel: "My own hint");

  @override
  String? get searchFieldLabel => hintText;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
            close(context, []);
          },
          icon: const Icon(Icons.clear_outlined))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, []);
        },
        icon: const Icon(Icons.arrow_back_ios_outlined));
  }

  @override
  Widget buildResults(BuildContext context) {
    searchText = query;
    return BlocProvider(
      create: ((context) => FolderBloc(RepositoryProvider.of(context))
        ..add(FolderPrivateSearchEvent(searchText: query))),
      child: BlocConsumer<FolderBloc, FolderState>(
        listener: (context, state) {
          if (state is PrivateSearchError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state is PrivateSearchLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.redAccent,
              ),
            );
          }
          if (state is PrivateSearchLoaded) {
            if (state.privateFolderSearch.result!.isEmpty) {
              return const Center(
                child: Text('No Folder Search'),
              );
            } else {
              return FolderList(folderList: state.privateFolderSearch);
            }
          }
          return Container();
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
