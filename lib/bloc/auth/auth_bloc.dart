import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:fuckingnum/repository/user/user-repository.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository _repository;

  AuthBloc(this._repository);

  @override
  AuthState get initialState => InitialAuthState();

  @override
  Stream<AuthState> mapEventToState(
    AuthState state,
    AuthEvent event,
  ) async* {
    if (event is RegisterEvent) {
      yield* _mapRegisterEventToState(event);
    }
    if (event is LoginEvent) {
      yield* _mapSignInEventToState(event);
    }

    if (event is AppStartedEvent) {
      yield InitialAuthState();
    }

    if (event is CloseDialogEvent) {
      yield InitialAuthState();
    }
  }

  Stream<AuthState> _errorToState(message) async* {
    yield ErrorAuthState(message);
    //yield InitialAuthState();
  }

  Stream<AuthState> _mapRegisterEventToState(event) async* {
    yield LoadingAuthState();
    try {
      //todo register account
//      await _repository.register(event.login, event.email, event.password);
      yield SuccessAuthState();
    } catch (error, stacktrace) {
      var errorData = json.decode(error.response.toString());

      yield* _errorToState(errorData['message']);
    }
  }

  Stream<AuthState> _mapSignInEventToState(event) async* {
    yield LoadingAuthState();
    try {
      await _repository.authenticate(
          username: event.login, password: event.password);
      yield SuccessAuthState();
    } catch (error, stacktrace) {
      var errorData = json.decode(error.response.toString());

      yield* _errorToState(errorData['message']);
    }
  }
}
