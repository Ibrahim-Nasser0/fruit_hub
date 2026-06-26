import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';

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
}
