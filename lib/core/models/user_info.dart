import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marshmallow/core/models/user_info_dto.dart';
part 'user_info.freezed.dart';

@freezed
class UserInfo with _$UserInfo {
  const UserInfo._();
  const factory UserInfo({
    String? fullName,
    String? idNumber,
    String? email,
    String? phoneNumber,
    DateTime? emailConfirmDate,
    DateTime? phoneConfirmDate,
    bool? notifications,
    bool? smsNotifications,
    bool? emailNotifications,
    @Default(0) int rewardPoints,
  }) = _UserInfo;

  UserInfoDTO toDTO() => UserInfoDTO(
        fullName: fullName,
        idNumber: idNumber,
        rewardPoints: rewardPoints,
        email: email,
        phoneNumber: phoneNumber,
        emailConfirmDate: emailConfirmDate != null
            ? Timestamp.fromDate(emailConfirmDate!)
            : null,
        phoneConfirmDate: phoneConfirmDate != null
            ? Timestamp.fromDate(phoneConfirmDate!)
            : null,
        notifications: notifications,
        smsNotifications: smsNotifications,
        emailNotifications: emailNotifications,
      );
}
