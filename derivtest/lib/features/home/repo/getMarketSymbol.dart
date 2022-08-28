import 'dart:convert';

import 'package:derivtest/core/repository_config.dart';

abstract class GetMarketRepo {
  Stream getMarketSymbols(Map<String, dynamic> data);
  void close();
}

class GetMarketRepoImp extends Repository with GetMarketRepo {
  @override
  getMarketSymbols(Map<String, dynamic> data) {
    channel.sink
        .add(json.encode({"active_symbols": "brief", "product_type": "basic"}));
    return channel.stream;
  }

  @override
  Future<void> close() {
    channel.sink.close();
    return super.close();
  }
}
