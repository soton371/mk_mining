import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mk_mining/models/sign_in_mod.dart';
import 'package:mk_mining/services/sign_in_ser.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<DoSignInEvent>((event, emit) async {
      debugPrint("call DoSignInEvent");
      emit(SignInLoading());

      Map<String, String> payload = {
        "email": event.email,
        "password": event.password
      };

      final SignInModel result = await signInService(payload: payload);

      if (result.status == 0) {
        emit(
            SignInException(message: result.message ?? "Something went wrong"));
        return;
      }

      emit(SignInSuccess());
    });
  }
}

