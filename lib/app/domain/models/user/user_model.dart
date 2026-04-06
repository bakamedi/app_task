import 'package:freezed_annotation/freezed_annotation.dart';

import '../../defs/type_defs.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
    required String name,
    String? photoUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Json json) => _$UserModelFromJson(json);

  static UserModel empty() => UserModel(
    id: '',
    email: '',
    name: '',
    photoUrl: '',
    createdAt: null,
    updatedAt: null,
  );
}
