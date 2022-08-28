import 'dart:convert';
import 'dart:io';

import 'package:web_socket_channel/web_socket_channel.dart';

class Repository {
  late WebSocketChannel channel;
  Repository() {
    _setup();
  }

  _setup() async {
    channel = WebSocketChannel.connect(
        Uri.parse("wss://ws.binaryws.com/websockets/v3?app_id=1089"));
  }

  close() async {
    channel.sink.close();
  }
}
