import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bussiness/folder/bloc/folder_bloc.dart';

class ExpansionTileExample extends StatelessWidget {
  const ExpansionTileExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FolderBloc(RepositoryProvider.of(context))
        ..add(LoadFolderPublicEvent()),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            EntryItem(data[index]),
        itemCount: data.length,
      ),
    );
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  const Entry(this.title, [this.children = const <Entry>[]]);
  final String title;
  final List<Entry> children;
}

// Data to display.
const List<Entry> data = <Entry>[
  Entry(
    'Chapter A',
    <Entry>[
      Entry(
        'Section A0',
        <Entry>[
          Entry('Item A0.1', <Entry>[Entry('Test'), Entry('Test 1')]),
          Entry('Item A0.2'),
        ],
      ),
      Entry('Section A1'),
      Entry('Section A2'),
    ],
  ),
  Entry(
    'Chapter B',
    <Entry>[
      Entry('Section B0'),
      Entry('Section B1'),
    ],
  ),
];

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry, {super.key});

  final Entry entry;

  Widget _buildTiles(Entry root, {int level = 0}) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title), // do something with level
      children: root.children
          .map((child) => _buildTiles(child, level: level + 1))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
