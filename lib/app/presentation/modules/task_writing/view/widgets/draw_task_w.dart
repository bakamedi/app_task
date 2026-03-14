import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';
import 'package:signature/signature.dart';

import '../../controller/task_writing_controller.dart';

class DrawTaskW extends StatelessWidget {
  const DrawTaskW({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, _) {
        final taskWritingController = ref.watch(taskWritingProvider);
        return Signature(
          controller: taskWritingController.state.signatureController!,
          backgroundColor: Colors.white,
        );
      },
    );
  }
}
