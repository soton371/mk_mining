import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class LocalDB {
  static const String loginBox = "loginBox";
  static const String loginIfo = "loginIfo";

  static Future<void> putLoginInfo({
    required String email,
    required String password,
    required String name,
    required String referCode,
    required String token,
    required String mainBalance,
    required String miningBalance,
  }) async {
    final box = await Hive.openBox(loginBox);
    box.put(loginIfo, [email, password, name, referCode, token, mainBalance, miningBalance]);
  }

  static Future<List<String>?> fetchLoginInfo() async {
    final box = await Hive.openBox(loginBox);
    final info = box.get(loginIfo);
    return info;
  }

  static Future<void> deleteLoginInfo() async {
    final box = await Hive.openBox(loginBox);
    await box.clear();
    debugPrint("call deleteLoginInfo");
  }
}
