import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marshmallow/auth/shared/provider.dart';
import 'package:marshmallow/core/auth_failure.dart';
import 'package:marshmallow/core/models/user_info.dart';
import 'package:marshmallow/core/repositories/firebase_authenticator.dart';
import 'package:marshmallow/core/repositories/user_repository.dart';

part 'auth_notifier.freezed.dart';

enum SignInMethods {
  phone,
  google,
  email,
  apple,
}

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.initial() = _Initial;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.authenticated(
    String userID, {
    required UserInfo? userInfo,
  }) = _Authenticated;

  const factory AuthState.failure(AuthFailure failure) = _Failure;
}

class AuthNotifier extends StateNotifier<AuthState> {
  static late String? userID;
  final FirebaseAuthenticator _authenticator;
  final UserRepository _userRepository;
  static late String? verificationID;

  AuthNotifier(this._authenticator, this._userRepository)
      : super(const AuthState.initial());

  String? get getUserID => userID;

//? Checks if the user is authenticated or not and updates the status accordingly.
  Future<void> checkAndUpdateAuthStatus() async {
    state = const AuthState.initial();
    userID = await _authenticator.getUserID();
    if (userID != null) {
      final userInfo = await _userRepository.getUserInfo(userID!);

      state = AuthState.authenticated(
        userID!,
        userInfo: userInfo,
      );
    } else {
      state = const AuthState.unauthenticated();
    }
  }

//? Creates a new user from scratch given a [UserInfo] model
  Future<void> createUser(UserInfo userInfo) async {
    userID = await _authenticator.getUserID();
    final failureOrSuccess =
        await _userRepository.createUser(userInfo.toDTO(), userID!);

    failureOrSuccess.fold(
      (l) => state = AuthState.authenticated(
        userID!,
        userInfo: userInfo,
      ),
      (r) => null,
    );
  }

//? Sends a login with email link to the given [email]
  Future<void> sendEmailLink(String email) async {
    final failureOrSuccess = await _authenticator.sendEmailLink(email: email);
    failureOrSuccess.fold((l) => null, (r) => state = AuthState.failure(r));
  }

//TODO: Only works on Android, test for iOS once we get apple team dev account.
//? Handles an oncoming auth dynamic link for email link sign in.
  Future<void> retrieveAuthDynamicLink({
    required bool fromColdState,
    required bool shouldSignIn,
  }) async {
    final failureOrSuccess = await _authenticator.retrieveAuthDynamicLink(
      fromColdState: fromColdState,
      shouldSignIn: shouldSignIn,
    );
    failureOrSuccess.fold(
      (user) async {
        if (user!.additionalUserInfo!.isNewUser) {
          createUser(
            UserInfo(
              email: user.user?.email,
              emailConfirmDate: DateTime.now(),
              notifications: true,
              smsNotifications: true,
              emailNotifications: true,
            ),
          );
        } else {
          userID = await _authenticator.getUserID();
          if (!shouldSignIn) {
            _userRepository.confirmUserEmail(
              userID: userID!,
              email: user.user!.email!,
            );
          }
          final userInfo = await _userRepository.getUserInfo(userID!);

          state = AuthState.authenticated(
            userID!,
            userInfo: userInfo,
          );
        }
      },
      (r) => state = AuthState.failure(r),
    );
  }

//? Signs the user in using google gmail.
  Future<void> signInWithGoogle() async {
    final failureOrSuccess = await _authenticator.signInWithGoogle();

    failureOrSuccess.fold(
      (l) async {
        if (l != null) {
          createUser(
            UserInfo(
              fullName: l.displayName,
              email: l.email,
              emailConfirmDate: DateTime.now(),
              notifications: true,
              smsNotifications: true,
              emailNotifications: true,
            ),
          );
        } else {
          userID = await _authenticator.getUserID();
          final userInfo = await _userRepository.getUserInfo(userID!);
          state = AuthState.authenticated(
            userID!,
            userInfo: userInfo,
          );
        }
      },
      (r) => state = AuthState.failure(r),
    );
  }

//TODO: Fix this once we get an official apple development team account.
//? Signs the user in with Apple.
  Future<void> signInWithApple() async {
    final failureOrSuccess = await _authenticator.signInWithApple();

    userID = await _authenticator.getUserID();
    final userInfo = await _userRepository.getUserInfo(userID!);
    state = failureOrSuccess.fold(
      (l) => AuthState.authenticated(
        userID!,
        userInfo: userInfo,
      ),
      (r) => AuthState.failure(r),
    );
  }

//? Starts the phone auth process by sending a SMS code to the given [phone]
  Future<void> initializeSignInWithPhone(String phone) async {
    _authenticator.verifyPhoneNumber(
      phone,
      codeSent: (String verificationId, int? resendToken) {
        verificationID = verificationId;
      },
    );
  }

//? Checks if the given code is correct. If [shouldSignIn] is true, it also signs in the user. If not, it link the auth credentials with the current auth user.
  Future<bool> verifyUserOTPCode(
    String code,
    String phone, {
    required bool shouldSignIn,
  }) async {
    final failureOrSuccess = await _authenticator.verifyUserOTPCode(
      code,
      verificationID!,
      shouldSignIn: shouldSignIn,
    );

    return failureOrSuccess.fold(
      (isNewUser) async {
        if (isNewUser) {
          createUser(
            UserInfo(
              phoneNumber: phone,
              phoneConfirmDate: DateTime.now(),
              notifications: true,
              smsNotifications: true,
              emailNotifications: true,
            ),
          );
        } else {
          userID = await _authenticator.getUserID();
          if (!shouldSignIn) {
            _userRepository.confirmUserPhoneNumber(
              userID: userID!,
              phone: phone,
            );
          }
          final userInfo = await _userRepository.getUserInfo(userID!);
          state = AuthState.authenticated(
            userID!,
            userInfo: userInfo,
          );
        }
        return true;
      },
      (r) {
        state = AuthState.failure(r);
        return false;
      },
    );
  }

//? Confirms the user's phone and stores it on the database.
  Future<void> confirmUserPhoneNumber(String phone, WidgetRef ref) async {
    userID = await _authenticator.getUserID();
    final failureOrSuccess = await _userRepository.confirmUserPhoneNumber(
      phone: phone,
      userID: userID!,
    );

    failureOrSuccess.fold(
      (l) => {
        ref.read(userInfoProvider.notifier).update(
              (state) => state?.copyWith(
                phoneNumber: phone,
                phoneConfirmDate: DateTime.now(),
              ),
            )
      },
      (r) => state = AuthState.failure(r),
    );
  }

  //? Signs the user out and updates the state.
  Future<void> updateField(String field, dynamic value) async {
    userID = await _authenticator.getUserID();
    final failureOrSuccess =
        await _userRepository.updateUserField(field, value, userID!);
    failureOrSuccess.fold(
      (l) => null,
      (r) => null,
    );
  }

//? Signs the user out and updates the state.
  Future<void> signOut() async {
    final failureOrSuccess = await _authenticator.signOut();

    state = failureOrSuccess.fold(
      (l) => AuthState.failure(l),
      (r) => const AuthState.unauthenticated(),
    );
  }
}
