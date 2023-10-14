import 'package:flutter/material.dart';
import 'package:number_selector/number_selector.dart';
import 'package:shader_space/app_constants.dart';

class ShaderPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShaderPageAppBar({
    super.key,
    required this.onUpdate,
  });

  final ValueChanged? onUpdate;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text(AppConstants.appName),
      actions: [
        NumberSelector.plain(
          current: 1,
          min: 1,
          showMinMax: false,
          decrementIcon: Icons.arrow_left,
          incrementIcon: Icons.arrow_right,
          onUpdate: onUpdate,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(
        AppConstants.spacingMedium,
      );
}
