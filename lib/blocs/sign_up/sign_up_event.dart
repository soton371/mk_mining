part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class DoSignUpEvent extends SignUpEvent {
  final String name, email, phone, password, cPassword, referCode;
  const DoSignUpEvent(
      {required this.name,
      required this.email,
      required this.phone,
      required this.password,
      required this.cPassword,
      required this.referCode});
  @override
  List<Object> get props =>
      [name, email, phone, password, cPassword, referCode];
}

class SendOtpEvent extends SignUpEvent {
  final String email;
  final bool fromForgotPassword;
  const SendOtpEvent({required this.email, this.fromForgotPassword = false});
  @override
  List<Object> get props => [email,fromForgotPassword];
}

class SubmitOtpEvent extends SignUpEvent {
  final String otpCode;
  const SubmitOtpEvent({required this.otpCode});
  @override
  List<Object> get props => [otpCode];
}
