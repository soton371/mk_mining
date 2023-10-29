import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk_mining/blocs/balance/balance_bloc.dart';
import 'package:mk_mining/blocs/refer/refer_bloc.dart';
import 'package:mk_mining/configs/colors.dart';
import 'package:mk_mining/configs/sizes.dart';
import 'package:mk_mining/database/local_db.dart';
import 'package:mk_mining/views/auth/sign_in_scr.dart';
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
  String name = '', email = '', referCode = '', token = '', mainBalance = '00', miningBalance = '00';
  Future<bool> getData() async {
    try {
      final loginInfo = await LocalDB.fetchLoginInfo();
      if (loginInfo == null || loginInfo.isEmpty) {
        return false;
      }
      name = loginInfo[2];
      email = loginInfo[0];
      referCode = loginInfo[3];
      token = loginInfo[4];
      mainBalance = loginInfo[5];
      miningBalance = loginInfo[6];
      setState(() {});
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  void initState() {
    getData().then((v) {
      if (v) {
        // context.read<BalanceBloc>().add(FetchBalanceEvent(token: token));  it use only time count down
        context.read<ReferBloc>().add(FetchReferUserEvent(token: token));
        return;
      } else {
        Navigator.pushReplacement(
            context, CupertinoPageRoute(builder: (_) => const SignInScreen()));
      }
    });
    super.initState();
  }

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
                    PopupMenuItem(
                        enabled: false,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(name),
                            Text(email),
                          ],
                        )),
                    PopupMenuItem(
                        onTap: () async {
                          await LocalDB.deleteLoginInfo().then((value) {
                            Navigator.pushReplacement(
                                context,
                                CupertinoPageRoute(
                                    builder: (_) => const SignInScreen()));
                          });
                        },
                        child: const Row(
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
            Padding(
              padding: const EdgeInsets.all(AppSizes.bodyPadding),
              child: BlocBuilder<BalanceBloc, BalanceState>(
                builder: (context, state) {
                  if (state is BalanceSuccessState) {
                    return Balance(
                    mainBalance: state.mainBalance,
                    miningBalance: state.miningBalance,
                  );
                  } else {
                    return Balance(
                    mainBalance: mainBalance,
                    miningBalance: miningBalance,
                  );
                  }
                  
                },
              ),
            ),

            const SizedBox(
              height: AppSizes.bodyPadding,
            ),

            Padding(
              padding: const EdgeInsets.all(AppSizes.bodyPadding),
              child: ReferCode(
                referCode: referCode,
              ),
            ),
            const SizedBox(
              height: AppSizes.bodyPadding + 8,
            ),

            //for refers list
            BlocBuilder<ReferBloc, ReferState>(
              builder: (context, state) {
                if (state is ReferLoadingState) {
                  return Text(
                    "The team is being brought..",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.grey.withOpacity(0.6),
                        fontWeight: FontWeight.w500),
                  );
                } else if (state is ReferSuccessState) {
                  return Column(
                    children: [
                      //title
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.bodyPadding),
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
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (_) => ReferListScreen(
                                              referUserList: state.referUsers,
                                            )));
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

                      //show list
                      ReferList(
                        referUserList: state.referUsers,
                        count: 10,
                      ),
                    ],
                  );
                } else if (state is ReferUserEmptyState) {
                  return Text(
                    "Your team has not been joined yet",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.grey.withOpacity(0.6),
                        fontWeight: FontWeight.w500),
                  );
                } else if (state is ReferFailedState) {
                  return Text(
                    state.msg,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.grey.withOpacity(0.6),
                        fontWeight: FontWeight.w500),
                  );
                } else {
                  return const Text('Else state');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
