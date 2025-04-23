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
      color: const Color.fromARGB(255, 254, 254, 254),
      child: TabBar(
        onTap: (value) {},
        indicator: DotIndicator(
          color: Theme.of(context).primaryColor,
          radius: 3,
        ),
        tabs: [
          Tab(child: Text('All')),
          Tab(child: Text('To Do')),
          Tab(child: Text('Completed')),
        ],
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
