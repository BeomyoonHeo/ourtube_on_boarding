import 'dart:math' as math;

import 'package:flutter/material.dart';

class StickyDelegateContainer extends SliverPersistentHeaderDelegate {
  double? minHeight;
  double? maxHeight;
  final Widget child;

  StickyDelegateContainer(
      {this.minHeight, this.maxHeight, required this.child}) {
    minHeight ?? 0;
    maxHeight ?? 0;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight!;

  @override
  double get minExtent => math.max(maxHeight!, minHeight!);

  @override
  bool shouldRebuild(StickyDelegateContainer oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
