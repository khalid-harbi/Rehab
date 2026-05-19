import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rehab/features/profile/domain/entities/profile_entity.dart';
part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
abstract class ProfileModel with _$ProfileModel {
  @JsonSerializable(fieldRename: .snake)
  const factory ProfileModel({
    required String id,
    required String name,
    @Default(
      'https://ui-avatars.com/api/?name=Placeholder&background=random&length=1',
    )
    String imageUrl,
    @Default('user') String role,
    required DateTime createdAt,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, Object?> json) =>
      _$ProfileModelFromJson(json);
}

extension ProfileModelMapper on ProfileModel {
  ProfileEntity toEntity() {
    String finalUrl = imageUrl;
    if (imageUrl.contains('name=Placeholder')) {
      // Replace "Placeholder" with the actual user's name
      // .trim() and .replaceAll to make the name URL-friendly
      final encodedName = name.trim().replaceAll(' ', '+');
      finalUrl =
          'https://ui-avatars.com/api/?name=$encodedName&background=random&length=1';
    }
    return ProfileEntity(
      id: id,
      name: name,
      imageUrl: finalUrl,
      role: role,
      createdAt: createdAt,
    );
  }
}
