import '../../../domain/models/failures/failure.dart';
import '../snackbar/snackbar_type.dart';
import '../utils/snackbar_util.dart';

extension FailureSnackbarExt on Failure {
  void show({String? content}) {
    SnackbarUtil.show(content ?? _message, type: _type);
  }

  /// Extrae el mensaje directamente del failure
  String get _message => when(
    network: (message, _) => message,
    unknown: (message, _) => message,
    api: (message, _, _) => message,
    auth: (message, _, _) => message,
    validation: (message, _, _) => message,
    business: (message, _) => message,
    noData: (message) => message,
    timeout: (message) => message,
    notFound: (message) => message,
    storage: (message) => message,
    supabase: (message) => message,
    biometric: (message) => message,
    biometricNoHardware: (message) => message,
    noBiometricsEnrolled: (message) => message,
    sessionExpired: (message) => message,
    cancelled: (message) => message,
    permissionDenied: (message, _) => message,
    eventOverlap: (message) => message,
  );

  /// Opcional: puedes diferenciar tipos visuales
  SnackbarType get _type => maybeWhen(
    validation: (_, _, _) => .warning,
    business: (_, _) => .warning,
    cancelled: (_) => .info,
    noData: (_) => .info,
    orElse: () => .error,
  );
}
