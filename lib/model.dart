class ExchangeRate {
  final DateTime time;
  final String assetIdBase;
  final String assetIdQuote;
  final double rate;

  ExchangeRate({
    required this.time,
    required this.assetIdBase,
    required this.assetIdQuote,
    required this.rate,
  });

  // Factory constructor to create an instance from JSON
  factory ExchangeRate.fromJson(Map<String, dynamic> json) {
    return ExchangeRate(
      time: DateTime.parse(json['time']),
      assetIdBase: json['asset_id_base'],
      assetIdQuote: json['asset_id_quote'],
      rate: json['rate'],
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'time': time.toIso8601String(),
      'asset_id_base': assetIdBase,
      'asset_id_quote': assetIdQuote,
      'rate': rate,
    };
  }
}
