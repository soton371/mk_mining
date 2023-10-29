import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mk_mining/database/local_db.dart';
import 'package:mk_mining/models/sign_in_mod.dart';
import 'package:mk_mining/services/sign_in_ser.dart';

part 'route_event.dart';
part 'route_state.dart';

class RouteBloc extends Bloc<RouteEvent, RouteState> {
  RouteBloc() : super(RouteInitial()) {
    on<DoRouteEvent>((event, emit) async {
      debugPrint("call DoRouteEvent");
      final loginInfo = await LocalDB.fetchLoginInfo();
      debugPrint(
          "loginInfo size: ${loginInfo == null ? '0' : loginInfo.length}");
      if (loginInfo == null || loginInfo.isEmpty) {
        emit(RouteLoginState());
        return;
      }

      //for login
      Map<String, String> payload = {
        "email": loginInfo[0],
        "password": loginInfo[1]
      };

      final SignInModel result = await signInService(payload: payload);

      if (result.status == 0) {
        emit(RouteLoginState());
        return;
      }

      final data = result.data;
      final balance = result.balance;
      if (data == null || balance == null) {
        emit( RouteLoginState());
        return;
      }

      final user = data.user;
      if (user == null) {
        emit(RouteLoginState());
        return;
      }

      if (user.isActive == "0") {
        emit(RouteLoginState());
        return;
      }

      emit(RouteHomeState());
    });
  }
}
