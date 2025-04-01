import 'package:tasks/features/auth/ui/bloc/auth_state.dart';

abstract interface class AuthService {
  Future<AuthState> signInWithEmailAndPassword(String email, String password);
  Future<AuthState> signOut();

  /* Future<void> signUpWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<void> resetPassword(String email);
  Future<void> updateProfile(String name, String photoUrl); */
}
