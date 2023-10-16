import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mk_mining/configs/colors.dart';
import 'package:mk_mining/configs/sizes.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

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
                  "assets/images/password.png",
                  width: AppSizes.width(context) * 0.3,
                ),
                Column(
                  children: [
                    Text(
                      "Enter Verification Code",
                      style: TextStyle(fontSize: AppSizes.width(context) * 0.07),
                    ),
                    const Text(
                      "We are automatically detecting a mail sent to your email address ****s01@gmail.com",
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: AppColors.seed,
                          borderRadius: BorderRadius.circular(AppSizes.radius)),
                      alignment: Alignment.center,
                      child: const Text(
                        "8",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                            fontSize: 35),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: AppColors.seed.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(AppSizes.radius)),
                      alignment: Alignment.center,
                      child: const TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      )
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: AppColors.seed.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(AppSizes.radius)),
                      alignment: Alignment.center,
                      child: const Text(
                        "",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                            fontSize: 35),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: AppColors.seed.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(AppSizes.radius)),
                      alignment: Alignment.center,
                      child: const Text(
                        "",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                            fontSize: 35),
                      ),
                    ),
                  ],
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
                    onPressed: () {}),
                    const SizedBox(),
                    const SizedBox(),
                    const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
