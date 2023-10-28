import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mk_mining/models/sign_in_mod.dart';
import 'package:mk_mining/services/sign_in_ser.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  String uName = '',
      uEmail = '',
      referCode = '',
      mainBalance = '',
      miningBalance = '',
      token = '';
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

      final data = result.data;
      final balance = result.balance;
      if (data == null || balance == null) {
        emit(const SignInException(message: "Data is empty"));
        return;
      }
      //for received balance
      mainBalance = balance.mainBalance ?? '';
      miningBalance = balance.miningBalance ?? '';

      //for received token
      token = data.token ?? '';

      final user = data.user;
      if (user == null) {
        emit(const SignInException(message: "User is empty"));
        return;
      }

      if (user.isActive == "0") {
        emit(const SignInException(message: "This user has been disabled"));
        return;
      }

      //for received user info
      uName = user.name ?? '';
      uEmail = user.email ?? '';
      referCode = user.referCode ?? '';

      emit(SignInSuccess());
    });
  }
}
