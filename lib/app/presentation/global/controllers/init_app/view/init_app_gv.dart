import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer/consumer_widget.dart';

import '../controller/init_app_gc.dart';

class InitAppGV extends ConsumerStatefulWidget {
  const InitAppGV({super.key, required this.body});

  final Widget body;

  @override
  ConsumerState<InitAppGV> createState() => _InitAppGVState();
}

class _InitAppGVState extends ConsumerState<InitAppGV> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _initializeApp());
    super.initState();
  }

  Future<void> _initializeApp() async {
    final InitAppGC initAppGC = iniAppGP.read();
    await initAppGC.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return widget.body;
  }
}
