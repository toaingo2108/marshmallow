import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:marshmallow/auth/application/auth_notifier.dart';
import 'package:marshmallow/core/auth_failure.dart';
import 'package:marshmallow/services/shared_preferences.dart';
import 'package:marshmallow/utils/functions.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class FirebaseAuthenticator {
  final GoogleSignIn _googleSignIn;
  final _auth = FirebaseAuth.instance;

  FirebaseAuthenticator(this._googleSignIn);

//? Begins the phone auth process.
  Future<void> verifyPhoneNumber(
    String phone, {
    required void Function(String, int?) codeSent,
  }) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: const Duration(minutes: 1),
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: codeSent,
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

//? Signs the user with google. If its a new user, it returns it, if not it returns a null user.
  Future<Either<User?, AuthFailure>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final user = await _auth.signInWithCredential(credential);

      return left(user.additionalUserInfo!.isNewUser ? user.user : null);
    } on FirebaseAuthException catch (e) {
      return right(AuthFailure.server(e.message));
    }
  }

//? Signs the user in with apple.
  Future<Either<Unit, AuthFailure>> signInWithApple() async {
    try {
      final rawNonce = generateNonce();
      final nonce = sha256ofString(rawNonce);

      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      await FirebaseAuth.instance.signInWithCredential(oauthCredential);
      return left(unit);
    } on FirebaseAuthException catch (e) {
      return right(AuthFailure.server(e.message));
    }
  }

//? Verifies if the OTP code is correct, If [shouldSignIn] is true, it logs the user in.
  Future<Either<bool, AuthFailure>> verifyUserOTPCode(
    String code,
    String verificationID, {
    required bool shouldSignIn,
  }) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationID,
        smsCode: code,
      );
      if (shouldSignIn) {
        final user = await _auth.signInWithCredential(credential);
        return left(user.additionalUserInfo!.isNewUser);
      }
      final currentUser = _auth.currentUser;
      await currentUser?.linkWithCredential(credential);
      return left(false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'credential-already-in-use') {
        return right(
          const AuthFailure.server(
            'This phone number is already being used by another account.',
          ),
        );
      } else if (e.code == 'invalid-verification-code') {
        return right(
          const AuthFailure.server(
            'The verification code is wrong. Check your phone number.',
          ),
        );
      } else {
        return right(
          const AuthFailure.server(
            'Something went wrong, try again later.',
          ),
        );
      }
    }
  }

//? Returns the current authenticated user.
  Future<User?> getCurrentUser() async => _auth.currentUser;

//? Returns the current authenticated userID.
  Future<String?> getUserID() async => _auth.currentUser?.uid;

//? Returns the SignInMethod the user used to sign in.
  Future<SignInMethods?> getAuthProvider() async {
    if (_auth.currentUser != null) {
      for (final providerProfile in _auth.currentUser!.providerData) {
        final provider = providerProfile.providerId;

        if (provider == 'phone') return SignInMethods.phone;
        if (provider == 'google.com') return SignInMethods.google;
        if (provider == 'password') return SignInMethods.email;
      }
    }
    return null;
  }

//? Signs the user out.
  Future<Either<AuthFailure, Unit>> signOut() async {
    try {
      await _auth.signOut();
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure.server(e.message));
    }
  }

//? Sends the email auth link.
  Future<Either<Unit, AuthFailure>> sendEmailLink({
    required String email,
  }) async {
    try {
      final actionCodeSettings = ActionCodeSettings(
        url: 'https://marshmallow.page.link/app',
        handleCodeInApp: true,
        androidPackageName: 'com.marshmallow.app',
        iOSBundleId: 'com.marshmallow.app',
      );

      await _auth.sendSignInLinkToEmail(
        email: email,
        actionCodeSettings: actionCodeSettings,
      );
      SPService.instance.setString('passwordLessEmail', email);
      return left(unit);
    } catch (e) {
      return right(AuthFailure.server(e.toString()));
    }
  }

//? Retrieves and handles the dynamic link. If [shouldSignIn] is true, it signs the user in. Otherwise it links the credentials with the current authenticated user.
  Future<Either<UserCredential?, AuthFailure>> retrieveAuthDynamicLink({
    required bool fromColdState,
    required bool shouldSignIn,
  }) async {
    try {
      final email = SPService.instance.getString('passwordLessEmail') ?? '';

      if (email.isEmpty) {
        return right(
          const AuthFailure.server('Something went wrong, try again later.'),
        );
      }

      PendingDynamicLinkData? dynamicLinkData;

      Uri? deepLink;
      if (fromColdState) {
        dynamicLinkData = await FirebaseDynamicLinks.instance.getInitialLink();
        if (dynamicLinkData != null) {
          deepLink = dynamicLinkData.link;
        }
      } else {
        dynamicLinkData = await FirebaseDynamicLinks.instance.onLink.first;
        deepLink = dynamicLinkData.link;
      }

      if (deepLink != null) {
        bool validLink = _auth.isSignInWithEmailLink(deepLink.toString());

        /// Password- less hack for IOS
        if (!validLink && Platform.isIOS) {
          final data = await Clipboard.getData('text/plain');
          if (data != null) {
            final linkData = data.text ?? '';
            final link = Uri.parse(linkData).queryParameters['link'] ?? "";

            validLink = _auth.isSignInWithEmailLink(link);
            if (validLink) {
              deepLink = Uri.parse(link);
            }
          }
        }

        /// End - Password- less hack for IOS

        SPService.instance.setString('passwordLessEmail', '');

        final userCredential = EmailAuthProvider.credentialWithLink(
          email: email,
          emailLink: deepLink.toString(),
        );
        if (shouldSignIn) {
          final user = await _auth.signInWithCredential(userCredential);
          return left(user);
        }
        final currentUser = _auth.currentUser;
        final cred = await currentUser?.linkWithCredential(userCredential);
        return left(cred);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return right(
          const AuthFailure.server(
            'The email is already in use, please try with another email.',
          ),
        );
      }
      if (e.code == 'invalid-action-code') {
        return right(
          const AuthFailure.server(
            'The link is invalid, please try again later.',
          ),
        );
      }
    }
    return right(
      const AuthFailure.server(
        'The link is invalid or has expired, try again later.',
      ),
    );
  }
}
//TODO: email auth not working on iOS
