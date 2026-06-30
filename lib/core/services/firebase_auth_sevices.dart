import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          throw ValidationException('', message: 'email_already_in_use');

        case 'weak-password':
          throw ValidationException('', message: 'weak_password');

        case 'invalid-email':
          throw ValidationException('', message: 'invalid_email');

        case 'network-request-failed':
          throw NetworkException('');

        default:
          throw ServerException('', message: 'unknown_error');
      }
    } catch (e) {
      throw ServerException('', message: e.toString());
    }
  }

  Future<User> loginUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw ValidationException('', message: 'invalid_email');

        case 'invalid-credential':
          throw ValidationException('', message: 'invalid_email_or_password');

        case 'user-disabled':
          throw ForbiddenException('', message: 'user_disabled');

        case 'network-request-failed':
          throw NetworkException('');

        case 'too-many-requests':
          throw ServerException('', message: 'too_many_requests');

        default:
          throw ServerException('', message: 'unknown_error');
      }
    } catch (_) {
      throw ServerException('', message: 'unknown_error');
    }
  }

  Future<User> loginWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await GoogleSignIn.instance
          .authenticate();

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      if (googleAuth.idToken == null) {
        throw ServerException('', message: 'google_token_missing');
      }

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );

      final user = userCredential.user;

      if (user == null) {
        throw ServerException('', message: 'user_null');
      }

      return user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'account-exists-with-different-credential':
          throw ValidationException(
            '',
            message: 'account_exists_with_different_credential',
          );

        case 'invalid-credential':
          throw ValidationException('', message: 'invalid_google_credential');

        case 'network-request-failed':
          throw NetworkException('');

        case 'too-many-requests':
          throw ServerException('', message: 'too_many_requests');

        default:
          throw ServerException('', message: 'unknown_error');
      }
    } catch (e) {
      if (e is AppException) rethrow;
      throw ServerException('', message: 'unknown_error');
    }
  }

  Future<User> loginWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.status != LoginStatus.success) {
        throw ServerException('', message: 'facebook_sign_in_cancelled');
      }

      final OAuthCredential credential = FacebookAuthProvider.credential(
        loginResult.accessToken!.tokenString,
      );

      final UserCredential userCredential = await _firebaseAuth
          .signInWithCredential(credential);

      final user = userCredential.user;

      if (user == null) {
        throw ServerException('', message: 'user_null');
      }

      return user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'account-exists-with-different-credential':
          throw ValidationException(
            '',
            message: 'account_exists_with_different_credential',
          );

        case 'invalid-credential':
          throw ValidationException('', message: 'invalid_facebook_credential');

        case 'network-request-failed':
          throw NetworkException('');

        case 'too-many-requests':
          throw ServerException('', message: 'too_many_requests');

        default:
          throw ServerException('', message: e.code);
      }
    } catch (e) {
      if (e is AppException) rethrow;
      throw ServerException('', message: e.toString());
    }
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw ValidationException('', message: 'invalid_email');

        case 'user-not-found':
          throw ValidationException('', message: 'user_not_found');

        case 'network-request-failed':
          throw NetworkException('');

        case 'too-many-requests':
          throw ServerException('', message: 'too_many_requests');

        default:
          throw ServerException('', message: 'unknown_error');
      }
    } catch (_) {
      throw ServerException('', message: 'unknown_error');
    }
  }

}
