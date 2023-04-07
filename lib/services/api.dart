import 'dart:async';
import 'package:finalproject/pages/exchange_rate_page.dart';

import '../services/response_body.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<ExchangeRate>> fetchExchangeRates() async {
  final String apiUrl =
      'https://api.exchangerate-api.com/v4/latest/USD?symbols=EUR,JPY,GBP,CAD,AUD,CHF,CNY,HKD,INR,SGD';
  final response = await http.get(Uri.parse(apiUrl));
  if (response.statusCode == 200) {
    final Map<String, dynamic> json = jsonDecode(response.body);
    final List<ExchangeRate> exchangeRates = [];
    for (var currency in json['rates'].keys) {
      final double rate = json['rates'][currency];
      final exchangeRate = ExchangeRate(currency: currency, rate: rate);
      exchangeRates.add(exchangeRate);
    }
    return exchangeRates;
  } else {
    throw Exception('Fail to fetch');
  }
}
