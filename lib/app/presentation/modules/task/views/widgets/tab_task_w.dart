import 'package:flutter/material.dart';

import '../../utils/get_tabs.dart';

class TabTaskW extends StatelessWidget {
  const TabTaskW({super.key, required this.body, required this.header});
  final SliverPersistentHeaderDelegate header;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: taskTabs.length,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [SliverPersistentHeader(pinned: true, delegate: header)];
        },
        body: body,
      ),
    );
  }
}
