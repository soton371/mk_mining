import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mk_mining/configs/colors.dart';
import 'package:mk_mining/configs/sizes.dart';
import 'package:mk_mining/views/auth/otp_scr.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg.jpg"), fit: BoxFit.cover)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.bodyPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/images/email.png",
                  width: AppSizes.width(context) * 0.25,
                ),
                Column(
                  children: [
                    Text(
                      "Enter Your Email Address",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: AppSizes.width(context) * 0.07),
                    ),
                    const Text(
                      "We will send you a confirmation code",
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "email",
                      filled: true,
                      isDense: true,
                      fillColor: AppColors.systemGrey3.withOpacity(0.3),
                      prefixIcon: const Icon(
                        CupertinoIcons.mail,
                      )),
                ),
                SizedBox(
                  width: AppSizes.width(context),
                  child: CupertinoButton.filled(
                      onPressed: () {
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (_) => const OTPScreen()));
                      },
                      child: const Text("Verify")),
                ),
                const SizedBox(),
                const Column(
                  children: [
                    Text(
                      "By continuing you agree to MK Mining",
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Terms of use",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                        Text(" & "),
                        Text(
                          "Privacy policy",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
