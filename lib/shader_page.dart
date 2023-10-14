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
        onPrevious: pageNumber == 1 ? null : _decrement,
        onNext: _increment,
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

  _decrement() {
    setState(() {
      pageNumber--;
    });
  }

  _increment() {
    setState(() {
      pageNumber++;
    });
  }
}
