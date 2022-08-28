import 'package:bloc/bloc.dart';
import 'package:derivtest/data_models/marketSymbolsModel.dart';
import 'package:equatable/equatable.dart';

part 'select_asset_state.dart';

class SelectAssetCubit extends Cubit<SelectAssetState> {
  SelectAssetCubit() : super(SelectAssetInitial());
  late List<MarketSymbolsModel> result;

  setData({required List<dynamic> data}) {
    emit(SelectAssetLoading());
    try {
      result = List<MarketSymbolsModel>.from(
          data.map((x) => MarketSymbolsModel.fromJson(x)));
      emit(SelectAssetLoaded(data: result));
    } catch (e) {
      emit(SelectAssetError(
          errorMsg: "Something went wrong please try again later"));
      throw e;
    }
  }

  updateSelection(MarketSymbolsModel marketSymbolsModel) {
    emit(SelectAssetLoading());
    filterData(
        filterString: marketSymbolsModel.symbolType!,
        marketSymbolsModel: marketSymbolsModel);
    // emit(SelectAssetLoaded(data: result, selectedMarket: marketSymbolsModel));
  }

  filterData(
      {required String filterString, MarketSymbolsModel? marketSymbolsModel}) {
    emit(SelectAssetLoading());
    if (filterString == "All") {
      emit(SelectAssetLoaded(data: result));
    } else {
      final data = result.where((element) {
        final name =
            "${element.symbolType ?? ""}${element.marketDisplayName ?? ""}"
                .toLowerCase();
        return name.contains(filterString.toLowerCase());
      }).toList();
      if (data.isNotEmpty) {
        marketSymbolsModel != null
            ? emit(SelectAssetLoaded(
                data: data, selectedMarket: marketSymbolsModel))
            : emit(SelectAssetLoaded(data: data));
      } else {
        emit(SelectAssetError(
            errorMsg: "Can not find $filterString", filterError: true));
        emit(SelectAssetLoaded(data: []));
      }
    }
  }
}
