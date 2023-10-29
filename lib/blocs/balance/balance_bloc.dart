import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mk_mining/services/balance_ser.dart';

part 'balance_event.dart';
part 'balance_state.dart';

class BalanceBloc extends Bloc<BalanceEvent, BalanceState> {
  BalanceBloc() : super(BalanceInitial()) {
    on<FetchBalanceEvent>((event, emit) async {
      debugPrint("call FetchBalanceEvent");
      final result = await balanceService(token: event.token);

      if (result.status == 0) {
        emit(BalanceFailedState());
        return;
      }

      final data = result.data;
      if (data == null) {
        emit(BalanceFailedState());
        return;
      }
      final mainBalance = data.mainBalance;
      final miningBalance = data.miningBalance;
      emit(BalanceSuccessState(
          mainBalance: mainBalance??'00', miningBalance: "${miningBalance ?? 00}"));
    });
  }
}
