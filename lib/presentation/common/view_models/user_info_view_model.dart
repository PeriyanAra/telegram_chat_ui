import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_view_model.freezed.dart';

@freezed
class UserInfoViewModel with _$UserInfoViewModel {
  const factory UserInfoViewModel({
    required String firstName,
    required String lastName,
    required String imageUrl,
  }) = _UserInfoViewModel;
}
