class TickModel {
  num? ask;
  num? bid;
  num? epoch;
  String? id;
  num? pipSize;
  num? quote;
  String? symbol;

  TickModel(
      {this.ask,
      this.bid,
      this.epoch,
      this.id,
      this.pipSize,
      this.quote,
      this.symbol});

  TickModel.fromJson(Map<String, dynamic> json) {
    ask = json['ask'];
    bid = json['bid'];
    epoch = json['epoch'];
    id = json['id'];
    pipSize = json['pip_size'];
    quote = json['quote'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ask'] = this.ask;
    data['bid'] = this.bid;
    data['epoch'] = this.epoch;
    data['id'] = this.id;
    data['pip_size'] = this.pipSize;
    data['quote'] = this.quote;
    data['symbol'] = this.symbol;
    return data;
  }
}
