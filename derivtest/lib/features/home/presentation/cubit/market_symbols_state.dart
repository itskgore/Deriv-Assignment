part of 'market_symbols_cubit.dart';

abstract class MarketSymbolsState extends Equatable {
  const MarketSymbolsState();

  @override
  List<Object> get props => [];
}

class MarketSymbolsInitial extends MarketSymbolsState {}

class MarketSymbolsLoading extends MarketSymbolsState {}

class MarketSymbolsLoaded extends MarketSymbolsState {
  final List<MarketSymbolsModel> marketSymbols;

  MarketSymbolsLoaded({required this.marketSymbols});
}

class MarketSymbolsError extends MarketSymbolsState {
  final String errorMsg;

  MarketSymbolsError({required this.errorMsg});
}
