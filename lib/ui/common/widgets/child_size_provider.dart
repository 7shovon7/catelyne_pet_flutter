import 'package:flutter/material.dart';

class SizeProviderWidget extends StatefulWidget {
  final Widget child;
  final Function(Size) onChildSize;

  const SizeProviderWidget({
    super.key,
    required this.onChildSize,
    required this.child,
  });
  @override
  _SizeProviderWidgetState createState() => _SizeProviderWidgetState();
}

class _SizeProviderWidgetState extends State<SizeProviderWidget> {
  @override
  void initState() {
    ///add size listener for first build
    _onResize();
    super.initState();
  }

  void _onResize() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (context.size is Size) {
        widget.onChildSize(context.size!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ///add size listener for every build uncomment the fallowing
    // _onResize();
    return widget.child;
  }
}

class ChildSizeNotifier extends StatefulWidget {
  final Widget Function(BuildContext context, Size size, Widget? child) builder;
  final Widget? child;

  const ChildSizeNotifier({
    super.key,
    required this.builder,
    this.child,
  });

  @override
  State<ChildSizeNotifier> createState() => _ChildSizeNotifierState();
}

class _ChildSizeNotifierState extends State<ChildSizeNotifier> {
  final ValueNotifier<Size> notifier = ValueNotifier(const Size(0, 0));
  Size size = Size.zero;

  // void _notifySize() {
  //   WidgetsBinding.instance.addPostFrameCallback(
  //     (_) {
  //       notifier.value = (context.findRenderObject() as RenderBox).size;
  //     },
  //   );
  // }

  @override
  void initState() {
    // _notifySize();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      notifier.value = (context.findRenderObject() as RenderBox).size;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // _notifySize();
    return ValueListenableBuilder(
      valueListenable: notifier,
      builder: widget.builder,
      child: widget.child,
    );
  }
}
