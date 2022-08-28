import 'dart:convert';

import 'package:derivtest/core/repository_config.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract class PriceBreakoutRepo {
  Stream getpriceBreakout(Map<String, dynamic> body);
  Stream forget(Map<String, dynamic> body);
  void close();
  void reopen();
}

class PriceBreakoutRepoImp extends Repository with PriceBreakoutRepo {
  @override
  Stream forget(Map<String, dynamic> body) {
    channel.sink.add(json.encode(body));
    return channel.stream;
  }

  @override
  Future<void> close() {
    channel.sink.close();
    return super.close();
  }

  @override
  Stream getpriceBreakout(Map<String, dynamic> body) {
    channel.sink.add(json.encode(body));
    return channel.stream;
  }

  @override
  void reopen() {
    channel = WebSocketChannel.connect(
        Uri.parse("wss://ws.binaryws.com/websockets/v3?app_id=1089"));
  }
}
