import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Sysnfusion extends StatelessWidget {
  Sysnfusion({Key? key, required this.fileId}) : super(key: key);
  final String fileId;
  final GlobalKey<SfPdfViewerState> _pfgViewer = GlobalKey();

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
