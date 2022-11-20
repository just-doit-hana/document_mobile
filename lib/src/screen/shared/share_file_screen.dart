import 'package:flutter/material.dart';

import '../../../app/util/app_constant.dart';

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
        title: const Text('Share file',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: AppConstant.poppinsFont,
                fontSize: 17)),
      ),
      body: const Center(
        child: Text('Share file user '),
      ),
    );
  }
}
