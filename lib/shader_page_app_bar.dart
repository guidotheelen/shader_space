import 'package:flutter/material.dart';
import 'package:shader_space/app_constants.dart';

class ShaderPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShaderPageAppBar({
    super.key,
    required this.onPrevious,
    required this.onNext,
  });

  final VoidCallback? onPrevious;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text(AppConstants.appName),
      actions: [
        IconButton(
          icon: const Icon(Icons.arrow_left),
          onPressed: onPrevious,
        ),
        IconButton(
          icon: const Icon(Icons.arrow_right),
          onPressed: onNext,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
