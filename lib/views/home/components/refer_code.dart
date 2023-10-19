import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mk_mining/configs/colors.dart';
import 'package:mk_mining/configs/sizes.dart';

class ReferCode extends StatelessWidget {
  const ReferCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.bodyPadding * 1.5),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radius),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: AppColors.hint.withOpacity(0.2),
              blurRadius: 10.0),
        ],
      ),
      child: Column(
        children: [
          Text(
            "Share your refer code with a friend and you both get coins\n",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.grey.withOpacity(0.6),
                fontWeight: FontWeight.w500),
          ),
          DottedBorder(
              color: AppColors.hint,
              borderType: BorderType.RRect,
              radius: const Radius.circular(AppSizes.radius / 2),
              child: Row(
                children: [
                  const Text(
                    "   RXGJ#GJBIQWERT",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.share),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.copy,
                      color: AppColors.seed,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
