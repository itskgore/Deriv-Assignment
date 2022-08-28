import 'package:derivtest/constants/methods.dart';
import 'package:derivtest/data_models/marketSymbolsModel.dart';
import 'package:derivtest/features/price_breakout/presentation/cubit/price_breakout_cubit.dart';
import 'package:derivtest/features/price_breakout/repo/priceBreakoutRepo.dart';
import 'package:derivtest/features/select_asset/cubit/select_asset_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectAssetDropdown extends StatelessWidget {
  const SelectAssetDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SelectAssetCubit, SelectAssetState>(
      listener: (con, state) {
        if (state is SelectAssetError) {
          if (state.filterError != null) {
            showSnackBar(context: context, title: state.errorMsg);
          }
        }
      },
      builder: (con, state) {
        if (state is SelectAssetLoading) {
          return SizedBox();
        } else if (state is SelectAssetLoaded) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: double.infinity,
            child: DropdownButton(
                isExpanded: true,
                value: state.selectedMarket,
                borderRadius: BorderRadius.circular(10),
                underline: SizedBox(),
                hint: Text("Select asset"),
                items: state.data.map<DropdownMenuItem<MarketSymbolsModel>>(
                    (MarketSymbolsModel value) {
                  return DropdownMenuItem<MarketSymbolsModel>(
                    value: value,
                    child: Text(value.displayName ?? ""),
                  );
                }).toList(),
                onChanged: (_) {
                  context
                      .read<SelectAssetCubit>()
                      .updateSelection(_ as MarketSymbolsModel);
                  context
                      .read<PriceBreakoutCubit>()
                      .getTicks(ticks: _.symbol ?? "");
                }),
          );
        } else if (state is SelectAssetError) {
          return Container();
        } else {
          return SizedBox();
        }
      },
    );
  }
}
