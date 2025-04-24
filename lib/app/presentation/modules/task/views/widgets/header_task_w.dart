import 'package:flutter/material.dart';

import '../../../../global/widgets/dots/dot_indicator_gw.dart';
import '../../utils/get_tabs.dart';

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
        labelColor: Theme.of(context).primaryColor,
        unselectedLabelColor: Colors.grey,
        indicatorColor: Colors.transparent,
        automaticIndicatorColorAdjustment: true,
        indicator: DotIndicator(
          color: Theme.of(context).primaryColor,
          radius: 3,
        ),
        tabs: taskTabs,
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
