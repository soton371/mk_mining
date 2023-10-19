import 'package:flutter/material.dart';
import 'package:mk_mining/configs/colors.dart';
import 'package:mk_mining/configs/sizes.dart';

class ReferList extends StatelessWidget {
  const ReferList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (_, i) => ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: AppSizes.bodyPadding),
              leading: Container(
                height: 48,
                width: 48,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [AppColors.seed, AppColors.nearlySeed]),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      bottomLeft: Radius.circular(4.0),
                      bottomRight: Radius.circular(4.0),
                      topRight: Radius.circular(25.0)),
                ),
                child: const Text(
                  "S",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white),
                ),
              ),
              title: const Text(
                "Soton Ahmed",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: const Text("tasmia437@gmail.com"),
            ));
  }
}
