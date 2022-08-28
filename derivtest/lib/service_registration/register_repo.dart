import 'package:derivtest/dependency_injection.dart';
import 'package:derivtest/features/home/repo/getMarketSymbol.dart';
import 'package:derivtest/features/price_breakout/repo/priceBreakoutRepo.dart';

class RegisterRepository {
  RegisterRepository() {
    locator.registerLazySingleton<GetMarketRepo>(
      () => GetMarketRepoImp(),
    );
    locator.registerLazySingleton<PriceBreakoutRepo>(
      () => PriceBreakoutRepoImp(),
    );
  }
}
