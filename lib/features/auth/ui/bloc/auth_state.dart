import 'package:tasks/features/auth/domain/entities/user_entity.dart';

sealed class AuthState {
  const AuthState();
}

class SignedInState extends AuthState {
  final UserEntity userEntity;

  const SignedInState(this.userEntity);
}

class SignedOutState extends AuthState {
  const SignedOutState();
}

class AuthLoadingState extends AuthState {
  const AuthLoadingState();
}
