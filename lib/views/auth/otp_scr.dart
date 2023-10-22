import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk_mining/blocs/sign_up/sign_up_bloc.dart';
import 'package:mk_mining/configs/colors.dart';
import 'package:mk_mining/configs/sizes.dart';
import 'package:mk_mining/views/auth/sign_in_scr.dart';
import 'package:mk_mining/widgets/app_alert_dialog.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key, required this.email});
  final String email;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final OtpFieldController otpCon = OtpFieldController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            debugPrint("otp match");
            appAlertDialog(context, "Welcome", "Your account is created successfully", actions: [
              CupertinoDialogAction(child: const Text('Go to login'),onPressed:()=> Navigator.pushReplacement(context, CupertinoPageRoute(builder: (_)=>const SignInScreen())),)
            ]);
          } else if (state is SignUpException) {
            appAlertDialog(context, "Warning", state.msg, actions: [
              CupertinoDialogAction(child: const Text('OK'),onPressed:()=> Navigator.pop(context),)
            ]);
          }
        },
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg.jpg"),
                  fit: BoxFit.cover)),
          child: ListView(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSizes.bodyPadding),
            children: [
              SizedBox(
                height: AppSizes.height(context) * 0.1,
              ),
              Image.asset(
                "assets/images/password.png",
                height: AppSizes.width(context) * 0.25,
              ),
              SizedBox(
                height: AppSizes.height(context) * 0.1,
              ),
              Column(
                children: [
                  Text(
                    "Enter Verification Code",
                    style: TextStyle(fontSize: AppSizes.width(context) * 0.07),
                  ),
                  Text(
                    "We are automatically detecting a mail sent to your email address *****${widget.email.substring(5)}",
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              SizedBox(
                height: AppSizes.height(context) * 0.1,
              ),

              //for otp code
              OTPTextField(
                controller: otpCon,
                length: 4,
                width: double.maxFinite,
                fieldWidth: 50,
                style: const TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                otpFieldStyle: OtpFieldStyle(focusBorderColor: AppColors.seed),
                onCompleted: (pin) {
                  debugPrint("Completed: $pin");
                  context.read<SignUpBloc>().add(SubmitOtpEvent(otpCode: pin));
                },
              ),
              //end for otp code

              SizedBox(
                height: AppSizes.height(context) * 0.1,
              ),

              CupertinoButton(
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't receive the OTP?",
                        style: TextStyle(color: AppColors.black),
                      ),
                      Text(" Resend OTP"),
                    ],
                  ),
                  onPressed: () {
                    otpCon.clear();
                    //new event for resend
                    context.read<SignUpBloc>().add(SendOtpEvent());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
