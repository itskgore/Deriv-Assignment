part of 'deriv_market_cubit.dart';

abstract class DerivMarketState extends Equatable {
  const DerivMarketState();

  @override
  List<Object> get props => [];
}

class DerivMarketInitial extends DerivMarketState {
  List<String> derivMarket = [
    "All",
    "Forex",
    "Synthetic indices",
    "Stock Indices",
    "Cryptocurrency",
    "Basket indices",
    "Commodities"
  ];
  final String? selectedMarket;

  DerivMarketInitial({required this.selectedMarket});
}

class DerivMarketReload extends DerivMarketState {}
