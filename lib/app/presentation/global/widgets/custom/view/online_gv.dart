import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer/consumer_widget.dart';

import '../../../utils/online_state.dart';
import '../../../controllers/supabase/supabase_gc.dart';

class OnlineGV extends ConsumerWidget {
  const OnlineGV({super.key});

  @override
  Widget build(BuildContext context, BuilderRef ref) {
    final controller = ref.watch(supabaseGP);
    switch (controller.state.onlineState) {
      case OnlineState.connecting:
        return CircularProgressIndicator.adaptive();
      case OnlineState.error:
        return Text('Supabase error');
      case OnlineState.noInternet:
        return Text('Sin internet');
      case OnlineState.ok:
        return Row(
          spacing: 6,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.circle, color: Colors.green, size: 10),
            Text(
              'Conectado',
              style: TextStyle(
                color: Colors.green.shade700,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
    }
  }
}
