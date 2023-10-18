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
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.bodyPadding),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: AppSizes.height(context) * 0.1,),
                Image.asset(
                  "assets/images/email.png",
                  width: AppSizes.width(context) * 0.25,
                ),
                SizedBox(height: AppSizes.height(context) * 0.1,),
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
                SizedBox(height: AppSizes.height(context) * 0.1,),
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
                SizedBox(height: AppSizes.height(context) * 0.1,),
                SizedBox(
                  width: AppSizes.width(context),
                  child: CupertinoButton.filled(
                      onPressed: () {
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (_) => const OTPScreen()));
                      },
                      child: const Text("Verify")),
                ),
                SizedBox(height: AppSizes.height(context) * 0.1,),
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
