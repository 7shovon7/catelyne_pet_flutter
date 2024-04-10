import 'package:catelyne_pet_flutter/ui/common/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class CsGridView extends StatelessWidget {
  const CsGridView({
    super.key,
    this.maxItemsPerRow = 3,
    required this.children,
    this.divider,
    this.childFlex = 10,
    this.dividerFlex = 1,
    this.rowGap = 10.0,
  });

  final int maxItemsPerRow;
  final List<Widget> children;
  final Widget? divider;
  final int childFlex;
  final int dividerFlex;
  final double rowGap;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = context.width;
    final double standardMinWidthPerItem =
        UiConstants.largeDisplayMinWidth / maxItemsPerRow;
    final int tempItemCount = deviceWidth ~/ standardMinWidthPerItem;
    final int updatedMaxItemsPerRow =
        tempItemCount > maxItemsPerRow ? maxItemsPerRow : tempItemCount;
    Widget finalDivider = divider ?? Container();

    List<Widget> columnChildren = [];
    List<Widget> rowChildren = [Expanded(flex: childFlex, child: children[0])];

    for (int i = 1; i < children.length; i++) {
      if (rowChildren.length < updatedMaxItemsPerRow * 2 - 2) {
        rowChildren.addAll([
          Expanded(flex: dividerFlex, child: finalDivider),
          Expanded(flex: childFlex, child: children[i]),
        ]);
      } else {
        columnChildren.addAll([
          Row(
            // mainAxisSize: MainAxisSize.min,
            children: rowChildren,
          ),
          SizedBox(height: rowGap),
        ]);
        rowChildren = [Expanded(flex: 10, child: children[i])];
      }
    }
    if (children.length % updatedMaxItemsPerRow > 0) {
      final int noOfBlankContainers =
          updatedMaxItemsPerRow - (children.length % updatedMaxItemsPerRow);
      if (noOfBlankContainers > 0) {
        for (int i = 0; i < noOfBlankContainers; i++) {
          rowChildren.addAll([
            Expanded(flex: 1, child: finalDivider),
            Expanded(flex: 10, child: finalDivider),
          ]);
        }
      }
    }
    columnChildren.addAll([
      Row(
        // mainAxisSize: MainAxisSize.min,
        children: rowChildren,
      ),
      SizedBox(height: rowGap),
    ]);

    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: columnChildren,
    );
  }
}
