import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marshmallow/core/models/user_info.dart';
part 'user_info_dto.freezed.dart';

@freezed
class UserInfoDTO with _$UserInfoDTO {
  const UserInfoDTO._();
  const factory UserInfoDTO({
    required String? fullName,
    required String? idNumber,
    required String? email,
    required String? phoneNumber,
    required Timestamp? emailConfirmDate,
    required Timestamp? phoneConfirmDate,
    required bool? notifications,
    required bool? smsNotifications,
    required bool? emailNotifications,
    required int? rewardPoints,
  }) = _UserInfoDTO;

  factory UserInfoDTO.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    // ignore: avoid_unused_constructor_parameters
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserInfoDTO(
      fullName: data?['fullName'] as String?,
      idNumber: data?['idNumber'] as String?,
      email: data?['email'] as String?,
      phoneNumber: data?['phoneNumber'] as String?,
      emailConfirmDate: data?['emailConfirmDate'] as Timestamp?,
      phoneConfirmDate: data?['phoneConfirmDate'] as Timestamp?,
      notifications: data?['notifications'] as bool?,
      smsNotifications: data?['smsNotifications'] as bool?,
      emailNotifications: data?['emailNotifications'] as bool?,
      rewardPoints: data?['rewardPoints'] as int?,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "fullName": fullName,
      "idNumber": idNumber,
      "email": email,
      "phoneNumber": phoneNumber,
      "emailConfirmDate": emailConfirmDate,
      "phoneConfirmDate": phoneConfirmDate,
      "notifications": notifications,
      "smsNotifications": smsNotifications,
      "emailNotifications": emailNotifications,
      "rewardPoints": rewardPoints,
    };
  }

  UserInfo toDomain() {
    return UserInfo(
      fullName: fullName,
      idNumber: idNumber,
      email: email,
      phoneNumber: phoneNumber,
      emailConfirmDate: emailConfirmDate?.toDate(),
      phoneConfirmDate: phoneConfirmDate?.toDate(),
      notifications: notifications,
      smsNotifications: smsNotifications,
      emailNotifications: emailNotifications,
      rewardPoints: rewardPoints ?? 0,
    );
  }
}
