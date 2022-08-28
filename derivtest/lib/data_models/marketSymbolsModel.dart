class MarketSymbolsModel {
  int? allowForwardStarting;
  int? delayAmount;
  String? displayName;
  int? exchangeIsOpen;
  String? exchangeName;
  int? intradayIntervalMinutes;
  int? isTradingSuspended;
  String? market;
  String? marketDisplayName;
  double? pip;
  String? quotedCurrencySymbol;
  double? spot;
  String? spotAge;
  String? spotTime;
  String? submarket;
  String? submarketDisplayName;
  String? symbol;
  String? symbolType;

  MarketSymbolsModel(
      {this.allowForwardStarting,
      this.delayAmount,
      this.displayName,
      this.exchangeIsOpen,
      this.exchangeName,
      this.intradayIntervalMinutes,
      this.isTradingSuspended,
      this.market,
      this.marketDisplayName,
      this.pip,
      this.quotedCurrencySymbol,
      this.spot,
      this.spotAge,
      this.spotTime,
      this.submarket,
      this.submarketDisplayName,
      this.symbol,
      this.symbolType});

  MarketSymbolsModel.fromJson(Map<String, dynamic> json) {
    allowForwardStarting = json['allow_forward_starting'];
    delayAmount = json['delay_amount'];
    displayName = json['display_name'];
    exchangeIsOpen = json['exchange_is_open'];
    exchangeName = json['exchange_name'];
    intradayIntervalMinutes = json['intraday_interval_minutes'];
    isTradingSuspended = json['is_trading_suspended'];
    market = json['market'];
    marketDisplayName = json['market_display_name'];
    pip = json['pip'];
    quotedCurrencySymbol = json['quoted_currency_symbol'];
    spot = json['spot'];
    spotAge = json['spot_age'];
    spotTime = json['spot_time'];
    submarket = json['submarket'];
    submarketDisplayName = json['submarket_display_name'];
    symbol = json['symbol'];
    symbolType = json['symbol_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['allow_forward_starting'] = this.allowForwardStarting;
    data['delay_amount'] = this.delayAmount;
    data['display_name'] = this.displayName;
    data['exchange_is_open'] = this.exchangeIsOpen;
    data['exchange_name'] = this.exchangeName;
    data['intraday_interval_minutes'] = this.intradayIntervalMinutes;
    data['is_trading_suspended'] = this.isTradingSuspended;
    data['market'] = this.market;
    data['market_display_name'] = this.marketDisplayName;
    data['pip'] = this.pip;
    data['quoted_currency_symbol'] = this.quotedCurrencySymbol;
    data['spot'] = this.spot;
    data['spot_age'] = this.spotAge;
    data['spot_time'] = this.spotTime;
    data['submarket'] = this.submarket;
    data['submarket_display_name'] = this.submarketDisplayName;
    data['symbol'] = this.symbol;
    data['symbol_type'] = this.symbolType;
    return data;
  }
}
