import 'package:flutter_meedu/providers.dart';

import '../../../data/source/providers/firebase/firebase_provider.dart';

class FirebaseInjectProvider {
  FirebaseInjectProvider._();

  static final firebaseInjectProvider = Provider<FirebaseProvider>(
    (ref) => FirebaseProvider(),
  );
}
