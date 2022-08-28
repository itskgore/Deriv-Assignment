import 'package:bloc/bloc.dart';
import 'package:derivtest/data_models/marketSymbolsModel.dart';
import 'package:derivtest/features/home/repo/getMarketSymbol.dart';
import 'package:equatable/equatable.dart';

part 'market_symbols_state.dart';

class MarketSymbolsCubit extends Cubit<MarketSymbolsState> {
  MarketSymbolsCubit(this.getMarketRepo) : super(MarketSymbolsInitial());

  final GetMarketRepo getMarketRepo;

  Future<void> close() {
    getMarketRepo.close();
    return super.close();
  }

  Stream getMarketSymbols() {
    return getMarketRepo
        .getMarketSymbols({"active_symbols": "brief", "product_type": "basic"});
  }
}
