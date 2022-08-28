import 'package:derivtest/features/deriv_market/cubit/deriv_market_cubit.dart';
import 'package:derivtest/features/select_asset/cubit/select_asset_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DerivMarketDropDown extends StatefulWidget {
  const DerivMarketDropDown({Key? key}) : super(key: key);

  @override
  _DerivMarketDropDownState createState() => _DerivMarketDropDownState();
}

class _DerivMarketDropDownState extends State<DerivMarketDropDown> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DerivMarketCubit, DerivMarketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is DerivMarketReload) {
          return Container();
        } else if (state is DerivMarketInitial) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: double.infinity,
            child: DropdownButton<String>(
                isExpanded: true,
                value: state.selectedMarket,
                borderRadius: BorderRadius.circular(10),
                underline: SizedBox(),
                hint: Text("Select the market"),
                items: state.derivMarket
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {
                  context.read<DerivMarketCubit>().updateSelection(_ ?? "");
                  context
                      .read<SelectAssetCubit>()
                      .filterData(filterString: _ ?? "");
                }),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
