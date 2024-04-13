import 'package:catelyne_pet_flutter/core/utils.dart';
import 'package:catelyne_pet_flutter/ui/common/ui_constants.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/scaffold/widgets/nav_bar/nav_bar.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/scaffold/widgets/nav_bar/widgets/drawer.dart';
import 'package:catelyne_pet_flutter/ui/common/widgets/scaffold/widgets/banner_background.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:measured_size/measured_size.dart';

class CsScaffold extends StatefulWidget {
  const CsScaffold({
    super.key,
    this.additionalBgHeight = 0.0,
    required this.foregroundWidgets,
    required this.mainWidgets,
    this.seoKeywords,
  });

  // if extra height is required
  final double additionalBgHeight;
  // Widgets which will be placed on top of the background
  final List<Widget> foregroundWidgets;
  // Main page body widgets which are used regardless of the background
  final List<Widget> mainWidgets;
  // If want to add new sets of SEO Keywords
  final List<String>? seoKeywords;

  @override
  State<CsScaffold> createState() => _CsScaffoldState();
}

class _CsScaffoldState extends State<CsScaffold> {
  double bgHeight = 0.0;
  @override
  Widget build(BuildContext context) {
    double deviceWidth = context.width;
    double contentWidth = deviceWidth > UiConstants.largeDisplayMaxWidth
        ? UiConstants.largeDisplayMaxWidth
        : deviceWidth;
    if (kIsWeb) {
      CoreUtils.applyGenericMetaSEO(keywords: widget.seoKeywords);
    }
    return Scaffold(
      endDrawer: const CSDrawer(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              BannerBackground(
                height: bgHeight + widget.additionalBgHeight,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      width: contentWidth,
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                          horizontal:
                              UiConstants.generalDisplayHorizontalPadding,
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
                        ],
                      ),
                    ),
                  ),
                  ...widget.mainWidgets,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
