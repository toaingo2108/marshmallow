import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:marshmallow/core/auth_failure.dart';
import 'package:marshmallow/core/firestore_failure.dart';
import 'package:marshmallow/core/models/user_info.dart';
import 'package:marshmallow/core/models/user_info_dto.dart';
import 'package:marshmallow/core/shared/api_path.dart';

class UserRepository {
  final firestore = FirebaseFirestore.instance;

//? Returns the document containing the users info given the [userID]
  Future<UserInfo?> getUserInfo(String userID) async {
    final userInfo = await firestore.doc(APIPath.userInfo(userID)).get();
    if (userInfo.exists) {
      return UserInfoDTO.fromFirestore(userInfo, null).toDomain();
    }
    return null;
  }

//? Confirms the user's phone on Firebase.
  Future<Either<Unit, AuthFailure>> confirmUserPhoneNumber({
    required String userID,
    required String phone,
  }) async {
    try {
      final docRef = firestore.doc(APIPath.userInfo(userID));
      await docRef.update({
        'phoneNumber': phone,
        'phoneConfirmDate': Timestamp.fromDate(DateTime.now())
      });
      return left(unit);
    } catch (e) {
      return right(AuthFailure.server(e.toString()));
    }
  }

//? Confirms the user's email on Firebase.
  Future<Either<Unit, AuthFailure>> confirmUserEmail({
    required String userID,
    required String email,
  }) async {
    try {
      final docRef = firestore.doc(APIPath.userInfo(userID));
      await docRef.update({
        'email': email,
        'emailConfirmDate': Timestamp.fromDate(DateTime.now())
      });
      return left(unit);
    } catch (e) {
      return right(AuthFailure.server(e.toString()));
    }
  }

//? Creates a user in firebase given a [UserInfoDTO].
  Future<Either<Unit, FirebaseFailure>> createUser(
    UserInfoDTO userInfo,
    String userID,
  ) async {
    final docRef = firestore.doc(APIPath.userInfo(userID)).withConverter(
          fromFirestore: UserInfoDTO.fromFirestore,
          toFirestore: (UserInfoDTO user, options) => user.toFirestore(),
        );
    try {
      await docRef.set(userInfo);
      return left(unit);
    } catch (e) {
      return right(FirebaseFailure.firestore(e.toString()));
    }
  }

  Future<Either<Unit, FirebaseFailure>> updateUserField(
    String field,
    dynamic value,
    String userID,
  ) async {
    final docRef = firestore.doc(APIPath.userInfo(userID)).withConverter(
          fromFirestore: UserInfoDTO.fromFirestore,
          toFirestore: (UserInfoDTO user, options) => user.toFirestore(),
        );
    try {
      await docRef.update({field: value});
      return left(unit);
    } catch (e) {
      return right(FirebaseFailure.firestore(e.toString()));
    }
  }
}
