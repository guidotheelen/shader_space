import 'package:flutter/material.dart';

import 'package:shader_space/shader_container.dart';
import 'package:shader_space/shader_page_app_bar.dart';

class ShaderPage extends StatefulWidget {
  const ShaderPage({super.key});

  @override
  State<ShaderPage> createState() => _ShaderPageState();
}

class _ShaderPageState extends State<ShaderPage> {
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
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ShaderContainer(
          pageNumber: pageNumber,
        ),
      ),
    );
  }
}
