import 'package:flutter/material.dart';

import '../../../../global/extensions/widgets_ext.dart';
import '../../../../global/utils/l10n_util.dart';
import '../../../../global/widgets/titles/title_gw.dart';

class TitleHeaderW extends StatelessWidget {
  const TitleHeaderW({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [TitleGW(title: L10nUtil.t.title)],
    ).padding(EdgeInsets.only(top: topPadding + 10, left: 16, right: 16));
  }
}
