import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@lazySingleton
class PriceRateNetwork {
  Stream<double> getEthToAedRateStream() async* {
    final response = await http.get(
      Uri.parse(
          'https://api.coingecko.com/api/v3/simple/price?ids=ethereum&vs_currencies=aed'),
    );
    final data = jsonDecode(response.body);
    double price = data['ethereum']['aed'] ?? 0;
    yield price;
    await Future.delayed(
      Duration(
        seconds: 10,
      ),
    );
  }
}
