import 'package:derivtest/dependency_injection.dart';
import 'package:derivtest/features/deriv_market/cubit/deriv_market_cubit.dart';
import 'package:derivtest/features/home/presentation/cubit/market_symbols_cubit.dart';
import 'package:derivtest/features/price_breakout/presentation/cubit/price_breakout_cubit.dart';
import 'package:derivtest/features/select_asset/cubit/select_asset_cubit.dart';

class RegisterBlocs {
  RegisterBlocs() {
    locator.registerFactory(
      () => DerivMarketCubit(),
    );
    locator.registerFactory(
      () => MarketSymbolsCubit(locator()),
    );
    locator.registerFactory(
      () => SelectAssetCubit(),
    );
    locator.registerFactory(
      () => PriceBreakoutCubit(locator()),
    );
  }
}
