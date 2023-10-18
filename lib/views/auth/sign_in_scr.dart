import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mk_mining/configs/colors.dart';
import 'package:mk_mining/configs/sizes.dart';
import 'package:mk_mining/views/auth/forgot_password_scr.dart';
import 'package:mk_mining/views/auth/sign_up_scr.dart';
import 'package:mk_mining/views/home/home.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSizes.height(context) * 0.1,),
                  Image.asset(
                    "assets/images/logo.png",
                    height: 30,
                  ),
                  SizedBox(height: AppSizes.height(context) * 0.1,),
                  //for input & title
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Start for"),
                      Text(
                        "Login to your account.\n",
                        style: TextStyle(
                            fontSize: AppSizes.width(context) * 0.07,
                            fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "email",
                            filled: true,
                            isDense: true,
                            fillColor: AppColors.systemGrey3.withOpacity(0.3),
                            prefixIcon: const Icon(CupertinoIcons.mail)),
                      ),
                      const SizedBox(
                        height: AppSizes.bodyPadding,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "password",
                            filled: true,
                            isDense: true,
                            fillColor: AppColors.systemGrey3.withOpacity(0.3),
                            prefixIcon: const Icon(CupertinoIcons.lock),
                            suffixIcon: const Icon(CupertinoIcons.eye_slash)),
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: CupertinoButton(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              child: const Text("Forgot password?"),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (_) =>
                                            const ForgotPasswordScreen()));
                              }))
                    ],
                  ),
                  //for input & title
                  SizedBox(height: AppSizes.height(context) * 0.1,),
            
                  //for button
                  Column(
                    children: [
                      SizedBox(
                        width: AppSizes.width(context),
                        child: CupertinoButton.filled(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (_) => const HomeScreen()));
                            },
                            child: const Text("Login my account")),
                      ),
                      const SizedBox(
                        height: AppSizes.bodyPadding,
                      ),
                      SizedBox(
                        width: AppSizes.width(context),
                        child: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppSizes.radius))),
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/images/search.png",
                              height: 16,
                              width: 16,
                            ),
                            label: const Text("Continue with google")),
                      )
                    ],
                  ),
                  //for button
            
                  SizedBox(
                    width: AppSizes.width(context),
                    child: CupertinoButton(
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Not a member?",
                              style: TextStyle(color: AppColors.black),
                            ),
                            Text(" Create account"),
                          ],
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              CupertinoPageRoute(
                                  builder: (_) => const SignUpScreen()));
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
