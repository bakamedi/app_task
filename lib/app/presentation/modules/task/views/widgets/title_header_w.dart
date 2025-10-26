import 'package:flutter/material.dart';

import '../../../../global/extensions/widgets_ext.dart';
import '../../../../global/l10n_gen/generated/s.dart';
import '../../../../global/widgets/titles/title_gw.dart';
import 'profile_btn_w.dart';

class TitleHeaderW extends StatelessWidget {
  const TitleHeaderW({super.key});

  @override
  Widget build(BuildContext context) {
    const double horizontal = 20;
    final topPadding = MediaQuery.of(context).padding.top;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TitleGW(title: AppLocalizations.of(context).title),
        ProfileBtnW(),
      ],
    ).padding(
      EdgeInsets.only(
        top: topPadding + 10,
        left: horizontal,
        right: horizontal,
      ),
    );
  }
}
