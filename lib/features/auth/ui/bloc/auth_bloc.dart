import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/features/auth/ui/bloc/auth_event.dart';
import 'package:tasks/features/auth/ui/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(SignedOutState()) {
    on<SignInEvent>(_signInEvent);
    on<SignOutEvent>(_signOutEvent);
  }

  void _signInEvent(SignInEvent event, Emitter<AuthState> emit) {}
  void _signOutEvent(SignOutEvent event, Emitter<AuthState> emit) {}
}
