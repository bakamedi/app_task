extension FlavorExt on AppFlavor {
  String? get name => toString().split('.').lastOrNull;

  bool get isDebugMode => this == AppFlavor.development;
}

enum AppFlavor { development, qa, staging, production }
