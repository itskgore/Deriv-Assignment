import 'dart:convert';

import 'package:derivtest/features/deriv_market/pages/derivMarketScreen.dart';
import 'package:derivtest/features/home/presentation/cubit/market_symbols_cubit.dart';
import 'package:derivtest/features/price_breakout/presentation/pages/price_breakdown_view.dart';
import 'package:derivtest/features/select_asset/cubit/select_asset_cubit.dart';
import 'package:derivtest/features/select_asset/presentation/select_asset_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Stream<dynamic>? data;

  @override
  void initState() {
    data = context.read<MarketSymbolsCubit>().getMarketSymbols();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Price market"),
      ),
      body: StreamBuilder<dynamic>(
          stream: data,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              context.read<MarketSymbolsCubit>().close();
              context
                  .read<SelectAssetCubit>()
                  .setData(data: jsonDecode(snapshot.data)['active_symbols']);
              return Column(
                children: [
                  DerivMarketDropDown(),
                  SelectAssetDropdown(),
                  PriceBreakdownView(),
                ],
              );
            } else if (snapshot.hasError) {
              return Container();
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
