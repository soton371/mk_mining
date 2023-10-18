import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mk_mining/configs/sizes.dart';
import 'package:mk_mining/views/home/components/balance.dart';

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
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.bodyPadding),
        child: Column(
          children: [
            Balance(),
          ],
        ),
      ),
    );
  }
}
