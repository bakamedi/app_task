import 'package:flutter/material.dart';

import '../../../../global/widgets/dots/dot_indicator_gw.dart';

class HeaderTaskW extends SliverPersistentHeaderDelegate {
  const HeaderTaskW();
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return ColoredBox(
      color: Colors.white,
      child: TabBar(
        onTap: (value) {},
        indicator: DotIndicator(
          color: Theme.of(context).primaryColor,
          radius: 3,
        ),
        tabs: [Tab(child: Text('To Do')), Tab(child: Text('Completed'))],
      ),
    );
  }

  @override
  double get maxExtent => kTextTabBarHeight;

  @override
  double get minExtent => kTextTabBarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
