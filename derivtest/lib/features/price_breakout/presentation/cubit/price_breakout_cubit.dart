import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:derivtest/data_models/tickModel.dart';
import 'package:derivtest/features/price_breakout/repo/priceBreakoutRepo.dart';
import 'package:equatable/equatable.dart';

part 'price_breakout_state.dart';

class PriceBreakoutCubit extends Cubit<PriceBreakoutState> {
  final PriceBreakoutRepo priceBreakoutRepo;
  PriceBreakoutCubit(this.priceBreakoutRepo) : super(PriceBreakoutInitial());
  String tickId = "";
  List<TickModel> tickModels = [];

  getTicks({required String ticks}) {
    emit(PriceBreakoutLoading());
    if (tickId.isNotEmpty) {
      tickModels.clear();
      emit(PriceBreakoutForget(
          priceBreakoutRepo.forget({"forget": "$tickId"}), ticks));
    } else {
      emit(PriceBreakoutLoading());
      emit(PriceBreakoutLoaded(
          priceBreakoutRepo
              .getpriceBreakout({"ticks": "$ticks", "subscribe": 1}),
          ticks));
    }
  }

  // setPrevData(TickModel data) {
  //   tickModels.add(data);
  //   if (tickModels.length >= 4) {
  //     tickModels.removeRange(0, tickModels.length - 2);
  //   }
  //   print(
  //       "${tickModels[0].quote}     ${tickModels[1].quote}    || ${tickModels.length}");
  // }
}
