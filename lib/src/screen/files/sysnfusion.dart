import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Sysnfusion extends StatefulWidget {
  const Sysnfusion({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SysnfusionState createState() => _SysnfusionState();
}

class _SysnfusionState extends State<Sysnfusion> {
  final GlobalKey<SfPdfViewerState> _pfgViewer = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Document Viewer'),
        actions: [
          IconButton(
              onPressed: () {
                _pfgViewer.currentState!.openBookmarkView();
              },
              icon: const Icon(
                Icons.bookmark,
                size: 26,
              ))
        ],
      ),
      body: SfPdfViewer.network(
        'https://file-examples.com/storage/fe8c7eef0c6364f6c9504cc/2017/10/file-sample_150kB.pdf',
        key: _pfgViewer,
      ),
    );
  }
}
