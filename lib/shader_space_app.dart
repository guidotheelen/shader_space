import 'package:flutter/material.dart';
import 'package:shader_space/shader_page.dart';

class ShaderSpaceApp extends StatelessWidget {
  const ShaderSpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shader Space',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const ShaderPage(),
    );
  }
}
