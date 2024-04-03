import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async {
      try {
        final email = event.email;
        final password = event.password;
        //Email validation
        if(password.length < 6){
          return emit(AuthFailure('Password can not be less than 6 charachters'));
        }
        await Future.delayed(const Duration(seconds: 1), () {
          return emit(AuthSuccess(uid: '$email-$password'));
        });
      } catch (e) {
        return emit(AuthFailure(e.toString()));
      }
    });
  }
}
