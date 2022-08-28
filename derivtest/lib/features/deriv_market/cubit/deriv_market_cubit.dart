import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'deriv_market_state.dart';

class DerivMarketCubit extends Cubit<DerivMarketState> {
  DerivMarketCubit() : super(DerivMarketInitial(selectedMarket: "All"));
  updateSelection(String selectedMarket) {
    emit(DerivMarketReload());
    emit(DerivMarketInitial(selectedMarket: selectedMarket));
  }
}
