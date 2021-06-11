import 'dart:async';

import 'package:fuckingnum/bloc/auth/auth_bloc.dart';
import 'package:fuckingnum/bloc/auth/auth_event.dart' as authEvent;
import 'package:fuckingnum/repository/user/user-repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginState currentState,
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
//        final token = await userRepository.authenticate(
//          username: event.username,
//          password: event.password,
//        );

        authenticationBloc
            .dispatch(authEvent.LoginEvent(event.username, event.password));

        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
