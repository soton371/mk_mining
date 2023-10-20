import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mk_mining/configs/colors.dart';
import 'package:mk_mining/configs/sizes.dart';
import 'package:mk_mining/views/home/components/balance.dart';
import 'package:mk_mining/views/refer/refer_code.dart';
import 'package:mk_mining/views/refer/refer_list.dart';
import 'package:mk_mining/views/refer/refer_list_scr.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Image.asset(
          "assets/images/logo.png",
          height: 35,
        ),
        actions: [
          PopupMenuButton(
              position: PopupMenuPosition.under,
              child: const CircleAvatar(
                child: Icon(CupertinoIcons.person),
              ),
              itemBuilder: (_) => [
                    const PopupMenuItem(
                        enabled: false,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Soton Ahmed"),
                            Text("tasmia437@gmail.com"),
                          ],
                        )),
                    const PopupMenuItem(
                        child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.power,
                          size: 16,
                        ),
                        Text("  Log out"),
                      ],
                    ))
                  ]),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            const Padding(
              padding: EdgeInsets.all(AppSizes.bodyPadding),
              child: Balance(),
            ),
            
            const Padding(
              padding: EdgeInsets.all(AppSizes.bodyPadding),
              child: ReferCode(),
            ),
            const SizedBox(height: AppSizes.bodyPadding,),
            //for refers list
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.bodyPadding),
              child: Row(
                children: [
                  Container(
                    height: 15,
                    width: 3,
                    decoration: const BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(AppSizes.radius))),
                  ),
                  const Text(
                    " Team",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (_) => const ReferListScreen()));
                    },
                    child: const Row(
                      children: [
                        Text(
                          'All',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            letterSpacing: 0.5,
                            color: AppColors.nearlySeed,
                          ),
                        ),
                        SizedBox(
                          height: 38,
                          width: 26,
                          child: Icon(
                            Icons.arrow_forward,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            
            const ReferList(),
          ]
          ,
        ),
      ),
    );
  }
}
