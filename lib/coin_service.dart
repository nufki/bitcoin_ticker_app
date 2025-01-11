import 'dart:convert';

import 'package:bitcoin_ticker_app/model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class CoinService {
  final String priceApi = dotenv.env['API_URI'] ?? '';
  final String apiKey = dotenv.env['API_KEY'] ?? '';

  CoinService() {}

  Future<ExchangeRate> fetchPrice(
      {required String base, required String quote}) async {
    final uri = Uri.parse('$priceApi$base/$quote');

    final headers = {'X-CoinAPI-Key': apiKey};

    print('uri: $uri');
    print('apikey: $apiKey');

    // Make the HTTP GET request
    final response = await http.get(uri, headers: headers);
    print(response.statusCode);

    // Handle the response
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return ExchangeRate.fromJson(json);
    } else {
      throw Exception(
          'Failed to fetch exchange rate. Status code: ${response.statusCode}');
    }
  }
}
