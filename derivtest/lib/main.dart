import 'package:derivtest/dependency_injection.dart';
import 'package:derivtest/features/deriv_market/cubit/deriv_market_cubit.dart';
import 'package:derivtest/features/home/presentation/cubit/market_symbols_cubit.dart';
import 'package:derivtest/features/home/presentation/pages/home.dart';
import 'package:derivtest/features/price_breakout/presentation/cubit/price_breakout_cubit.dart';
import 'package:derivtest/features/select_asset/cubit/select_asset_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await setupServicesLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DerivMarketCubit>(
          create: (BuildContext context) => locator<DerivMarketCubit>(),
        ),
        BlocProvider<MarketSymbolsCubit>(
          create: (BuildContext context) => locator<MarketSymbolsCubit>(),
        ),
        BlocProvider<SelectAssetCubit>(
          create: (BuildContext context) => locator<SelectAssetCubit>(),
        ),
        BlocProvider<PriceBreakoutCubit>(
          create: (BuildContext context) => locator<PriceBreakoutCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
