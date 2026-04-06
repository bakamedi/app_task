import '../../../domain/models/user/user_model.dart';

extension UserModelExt on UserModel {
  bool get isEmpty => id.isEmpty && email.isEmpty && name.isEmpty;
}
