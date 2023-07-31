import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:marshmallow/auth/application/auth_notifier.dart';
import 'package:marshmallow/core/models/user_info.dart';
import 'package:marshmallow/core/repositories/firebase_authenticator.dart';
import 'package:marshmallow/core/repositories/user_repository.dart';
import 'package:riverpod/riverpod.dart';

final userInfoProvider = StateProvider<UserInfo?>((ref) => null);

final googleSignInProvider = Provider(
  (ref) => GoogleSignIn(
    clientId: kIsWeb
        ? '-bi1d2m0tusoqo1f8fl263vpt3kbbeupc.apps.googleusercontent.com'
        : null,
  ),
);

final firebaseAuthenticatorProvider =
    Provider((ref) => FirebaseAuthenticator(ref.watch(googleSignInProvider)));

final userRepositoryProvider = Provider((ref) => UserRepository());

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(
    ref.watch(firebaseAuthenticatorProvider),
    ref.watch(
      userRepositoryProvider,
    ),
  ),
);
