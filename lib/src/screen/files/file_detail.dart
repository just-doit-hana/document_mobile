import 'package:flutter/material.dart';

class FileDetail extends StatefulWidget {
  const FileDetail({Key? key}) : super(key: key);

  @override
  State<FileDetail> createState() => _FileDetailState();
}

class _FileDetailState extends State<FileDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            const SliverAppBar(
              pinned: true,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('File detail'),
                centerTitle: true,
                background: Icon(
                  Icons.folder,
                  size: 100,
                ),
              ),
              elevation: 10.0,
              automaticallyImplyLeading: true,
              floating: true,
              snap: true,
            )
          ];
        },
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 40,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 100.0,
              child: Card(
                color: Colors.cyan[100 * (index % 9)],
                child: Text('Item $index'),
              ),
            );
          },
        ),
      ),
    );
  }
}
