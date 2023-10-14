import 'dart:html' as html;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

import 'package:shader_space/shader_container.dart';
import 'package:shader_space/shader_page_app_bar.dart';

class ShaderPage extends StatefulWidget {
  const ShaderPage({super.key});

  @override
  State<ShaderPage> createState() => _ShaderPageState();
}

class _ShaderPageState extends State<ShaderPage> {
  final screenShotController = ScreenshotController();
  var pageNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShaderPageAppBar(
        onUpdate: (value) {
          setState(() {
            pageNumber = value;
          });
        },
        onScreenShot: () async {
          screenShotController.capture().then((Uint8List? image) {
            if (image != null) {
              // final file = File.fromRawPath(image);
              final pngBytes = image.buffer.asUint8List();
              final blob =
                  html.Blob(<dynamic>[pngBytes], 'application/octet-stream');
              html.AnchorElement(href: html.Url.createObjectUrlFromBlob(blob))
                ..setAttribute('download', 'tile.png')
                ..click();
            }
          }).catchError((onError) {});
        },
      ),
      body: Screenshot(
        controller: screenShotController,
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: ShaderContainer(
            pageNumber: pageNumber,
          ),
        ),
      ),
    );
  }
}
