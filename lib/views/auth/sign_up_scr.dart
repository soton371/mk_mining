import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mk_mining/configs/colors.dart';
import 'package:mk_mining/configs/sizes.dart';
import 'package:mk_mining/views/auth/otp_scr.dart';
import 'package:mk_mining/views/auth/sign_in_scr.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create a new account.",
                        style: TextStyle(
                            fontSize: AppSizes.width(context) * 0.07,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text("After creating an account you will get 500 coins",style: TextStyle(color: AppColors.hint),)
                    ],
                  ),

                  //for input & title
                  Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Name",
                            filled: true,
                            isDense: true,
                            fillColor: AppColors.systemGrey3.withOpacity(0.3),
                            prefixIcon: const Icon(CupertinoIcons.person)),
                      ),
                      const SizedBox(
                        height: AppSizes.bodyPadding,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Email",
                            filled: true,
                            isDense: true,
                            fillColor: AppColors.systemGrey3.withOpacity(0.3),
                            prefixIcon: const Icon(CupertinoIcons.mail),),
                      ),
                      const SizedBox(
                        height: AppSizes.bodyPadding,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Phone",
                            filled: true,
                            isDense: true,
                            fillColor: AppColors.systemGrey3.withOpacity(0.3),
                            prefixIcon: const Icon(CupertinoIcons.phone),
                            
                            ),
                      ),
                      const SizedBox(
                        height: AppSizes.bodyPadding,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Password",
                            filled: true,
                            isDense: true,
                            fillColor: AppColors.systemGrey3.withOpacity(0.3),
                            prefixIcon: const Icon(CupertinoIcons.lock),
                            suffixIcon: const Icon(CupertinoIcons.eye_slash)
                            ),
                      ),
                      const SizedBox(
                        height: AppSizes.bodyPadding,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Confirm password",
                            filled: true,
                            isDense: true,
                            fillColor: AppColors.systemGrey3.withOpacity(0.3),
                            prefixIcon: const Icon(CupertinoIcons.lock),
                            suffixIcon: const Icon(CupertinoIcons.eye_slash)
                            ),
                      ),
                      const SizedBox(
                        height: AppSizes.bodyPadding,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Refer code",
                            filled: true,
                            isDense: true,
                            fillColor: AppColors.systemGrey3.withOpacity(0.3),
                            prefixIcon: const Icon(CupertinoIcons.tag),
                            ),
                      ),
                    ],
                  ),
                  //for input & title

                  //for button
                  SizedBox(
                    width: AppSizes.width(context),
                    child: CupertinoButton.filled(
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (_) => const OTPScreen()));
                        },
                        child: const Text("Create a account")),
                  ),
                  //for button

                  SizedBox(
                    width: AppSizes.width(context),
                    child: CupertinoButton(
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have a account?",
                              style: TextStyle(color: AppColors.black),
                            ),
                            Text(" Sign In"),
                          ],
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              CupertinoPageRoute(
                                  builder: (_) => const SignInScreen()));
                        }),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
