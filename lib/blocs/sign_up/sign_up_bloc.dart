import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<DoSignUpEvent>((event, emit) {
      debugPrint("call DoSignUpEvent");
      // debugPrint("name: ${event.name}, email: ${event.email}, phone: ${event.phone}, password: ${event.password}, cPassword: ${event.cPassword}, refer code: ${event.referCode}");
      emit(SignUpLoading());
      if (event.email.trim().isEmpty &&
          event.name.trim().isEmpty &&
          event.password.trim().isEmpty) {
        emit(const SignUpException(msg: "Fill in the mandatory fields"));
        return;
      }

      if (event.name.trim().length < 3) {
        emit(const SignUpException(msg: "Please enter full name"));
        return;
      }

      if (!event.name.trim().startsWith(RegExp(r'^[a-zA-Z][a-zA-Z ]'))) {
        emit(const SignUpException(msg: "Name must start with a letter"));
        return;
      }

      if (!event.name.trim().startsWith(RegExp(r'^[a-zA-Z][a-zA-Z ]'))) {
        emit(const SignUpException(msg: "Name must start with a letter"));
        return;
      }

      if (event.phone.trim().isNotEmpty && event.phone.trim().length != 11) {
        emit(const SignUpException(msg: "Please enter 11-digit number"));
        return;
      }

      if (event.phone.trim().contains(RegExp(r'^[a-zA-Z][a-zA-Z ]'))) {
        emit(const SignUpException(msg: "Number must be numeric"));
        return;
      }

      if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
          .hasMatch(event.email)) {
        emit(const SignUpException(msg: "Please enter valid email"));
        return;
      }

      if (event.password.trim().length <= 5) {
        emit(const SignUpException(msg: "Password must be more than 5 characters"));
        return;
      }

      if (event.password != event.cPassword) {
        emit(const SignUpException(msg: "No two passwords are the same"));
        return;
      }

      emit(SignUpSuccess());
    });
  }
}
