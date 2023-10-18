import 'package:flutter/material.dart';
import 'package:mk_mining/configs/colors.dart';
import 'package:mk_mining/configs/sizes.dart';

class Balance extends StatelessWidget {
  const Balance({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            //for balance
            Row(
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
                  " Balance",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(AppSizes.bodyPadding),
              margin: const EdgeInsets.only(top: AppSizes.radius),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topRight: Radius.circular(68.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: AppColors.grey.withOpacity(0.2),
                      offset: const Offset(1, 1),
                      blurRadius: 10.0),
                ],
              ),
              child: Row(
                children: [
                  //balance status
                  Expanded(
                      child: Column(
                    children: [
                      //for main balance
                      Row(
                        children: <Widget>[
                          Container(
                            height: 48,
                            width: 2,
                            decoration: BoxDecoration(
                              color: AppColors.seed.withOpacity(0.5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4.0)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 4, bottom: 2),
                                  child: Text(
                                    'Main',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      letterSpacing: -0.1,
                                      color: AppColors.grey.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 28,
                                      height: 28,
                                      child:
                                          Image.asset("assets/images/coin.png"),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 4, bottom: 3),
                                      child: Text(
                                        '500',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: AppColors.darkerText,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 4, bottom: 3),
                                      child: Text(
                                        'Coins',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          letterSpacing: -0.2,
                                          color:
                                              AppColors.grey.withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      //end main balance

                      //for mining balance
                      Row(
                        children: <Widget>[
                          Container(
                            height: 48,
                            width: 2,
                            decoration: BoxDecoration(
                              color: AppColors.nearlySeed.withOpacity(0.5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4.0)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 4, bottom: 2),
                                  child: Text(
                                    'Mining',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      letterSpacing: -0.1,
                                      color: AppColors.grey.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 28,
                                      height: 28,
                                      child: Image.asset(
                                          "assets/images/mining.png"),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 4, bottom: 3),
                                      child: Text(
                                        '01',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: AppColors.darkerText,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 4, bottom: 3),
                                      child: Text(
                                        'Coins',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          letterSpacing: -0.2,
                                          color:
                                              AppColors.grey.withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),

                      //end mining balance
                    ],
                  )),
                  //balance status

                  //count down
                  Expanded(
                    child: Center(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  '15:03',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 24,
                                    letterSpacing: 0.0,
                                    color: AppColors.nearlySeed,
                                  ),
                                ),
                                Text(
                                  'Hrs left',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    letterSpacing: 0.0,
                                    color: AppColors.grey.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                           SizedBox(
                            width: 100,
                            height: 100,
                            child: CircularProgressIndicator(
                              value: 0.6,
                              backgroundColor: AppColors.nearlySeed.withOpacity(0.3),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  //Count down
                ],
              ),
            ),
            //end balance
          ],
        );
  }
}