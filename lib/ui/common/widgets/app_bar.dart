import 'package:flutter/material.dart';

class MarsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MarsAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.color,
  });

  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color ?? Colors.transparent,
      title: Text(title),
      leading: leading,
      actions: actions ??
          [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
              ),
            ),
          ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
