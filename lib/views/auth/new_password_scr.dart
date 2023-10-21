import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mk_mining/configs/colors.dart';
import 'package:mk_mining/configs/sizes.dart';
import 'package:mk_mining/views/auth/sign_in_scr.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg.jpg"), fit: BoxFit.cover)),
        ),

        ListView(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.bodyPadding),
          children: [
            SizedBox(
              height: AppSizes.height(context) * 0.1,
            ),
            Image.asset(
              "assets/images/reset-password.png",
              height: AppSizes.width(context) * 0.25,
            ),
            SizedBox(
              height: AppSizes.height(context) * 0.1,
            ),
            Column(
              children: [
                Text(
                  "Reset Password",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: AppSizes.width(context) * 0.07),
                ),
                const Text(
                  "Set the new password for your account so you can login and access all the feature",
                  textAlign: TextAlign.center,
                )
              ],
            ),
            SizedBox(
              height: AppSizes.height(context) * 0.1,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "New Password",
                  filled: true,
                  isDense: true,
                  fillColor: AppColors.systemGrey3.withOpacity(0.3),
                  prefixIcon: const Icon(
                    CupertinoIcons.lock,
                  )),
            ),
            const SizedBox(
              height: AppSizes.bodyPadding,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Confirm Password",
                  filled: true,
                  isDense: true,
                  fillColor: AppColors.systemGrey3.withOpacity(0.3),
                  prefixIcon: const Icon(
                    CupertinoIcons.lock,
                  )),
            ),
            SizedBox(
              height: AppSizes.height(context) * 0.1,
            ),
            CupertinoButton.filled(
                onPressed: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (_) => const SignInScreen()));
                },
                child: const Text("Reset Password")),
          ],
        ),
      ],
    ));
  }
}
