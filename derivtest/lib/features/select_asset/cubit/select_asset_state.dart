part of 'select_asset_cubit.dart';

abstract class SelectAssetState extends Equatable {
  const SelectAssetState();

  @override
  List<Object> get props => [];
}

class SelectAssetInitial extends SelectAssetState {}

class SelectAssetLoading extends SelectAssetState {}

class SelectAssetError extends SelectAssetState {
  final String errorMsg;
  bool? filterError;

  SelectAssetError({required this.errorMsg, this.filterError});
}

class SelectAssetLoaded extends SelectAssetState {
  final List<MarketSymbolsModel> data;
  final MarketSymbolsModel? selectedMarket;

  SelectAssetLoaded({required this.data, this.selectedMarket});
}
