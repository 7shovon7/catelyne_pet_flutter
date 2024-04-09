import 'package:catelyne_pet_flutter/ui/common/ui_constants.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/nav_bar/nav_bar.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/nav_bar/widgets/drawer.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/scaffold/banner_background.dart';
import 'package:flutter/material.dart';
import 'package:measured_size/measured_size.dart';

class CsScaffold extends StatefulWidget {
  const CsScaffold({
    super.key,
    this.additionalBgHeight = 0.0,
    required this.foregroundWidgets,
    required this.mainWidgets,
  });

  // if extra height is required
  final double additionalBgHeight;
  // Widgets which will be placed on top of the background
  final List<Widget> foregroundWidgets;
  // Main page body widgets which are used regardless of the background
  final List<Widget> mainWidgets;

  @override
  State<CsScaffold> createState() => _CsScaffoldState();
}

class _CsScaffoldState extends State<CsScaffold> {
  double bgHeight = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const CSDrawer(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            BannerBackground(
              height: bgHeight + widget.additionalBgHeight,
            ),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: UiConstants.generalDisplayHorizontalPadding,
              ),
              children: [
                MeasuredSize(
                  onChange: (p0) {
                    setState(() {
                      bgHeight = p0.height;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CSNavBar(),
                      // Banner main content
                      ...widget.foregroundWidgets,
                    ],
                  ),
                ),
                ...widget.mainWidgets,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
