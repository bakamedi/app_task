import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class DrawTaskW extends StatelessWidget {
  const DrawTaskW({super.key, required this.signatureController});

  final SignatureController signatureController;

  @override
  Widget build(BuildContext context) {
    return Signature(
      controller: signatureController,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
