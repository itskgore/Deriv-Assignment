part of 'price_breakout_cubit.dart';

abstract class PriceBreakoutState extends Equatable {
  const PriceBreakoutState();

  @override
  List<Object> get props => [];
}

class PriceBreakoutInitial extends PriceBreakoutState {}

class PriceBreakoutLoading extends PriceBreakoutState {}

class PriceBreakoutForget extends PriceBreakoutState {
  final Stream<dynamic> data;
  final String ticks;

  PriceBreakoutForget(this.data, this.ticks);
}

class PriceBreakoutLoaded extends PriceBreakoutState {
  final Stream<dynamic> data;
  final String ticks;
  List<TickModel> tickModels = [];

  PriceBreakoutLoaded(this.data, this.ticks) {}

  TickModel setData(dynamic data) {
    return TickModel.fromJson(jsonDecode(data)['tick']);
  }

  setPrevData(TickModel data) {
    tickModels.add(data);
    if (tickModels.length >= 4) {
      tickModels.removeRange(0, tickModels.length - 2);
      if (tickModels[0].quote != tickModels[1].quote) {
        // print(
        //     "${tickModels[0].quote}     ${tickModels[1].quote}    || ${tickModels.length}");
      }
    }
  }
}

class PriceBreakoutError extends PriceBreakoutState {
  final String errorMsg;

  PriceBreakoutError(this.errorMsg);
}
