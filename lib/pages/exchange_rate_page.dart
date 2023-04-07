import '../services/api.dart';
import '../services/response_body.dart';
import 'package:flutter/material.dart';

class ExchangeRatePage extends StatefulWidget {
  const ExchangeRatePage({Key? key}) : super(key: key);
  @override
  _ExchangeRatePageState createState() => _ExchangeRatePageState();
}

class _ExchangeRatePageState extends State<ExchangeRatePage> {
  late Future<List<ExchangeRate>> _futureExchangeRates;
  @override
  void initState() {
    super.initState();
    _futureExchangeRates = fetchExchangeRates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exchange Rates'),
      ),
      body: FutureBuilder<List<ExchangeRate>>(
          future: _futureExchangeRates,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<ExchangeRate> exchangeRates = snapshot.data!;
              return ListView.builder(
                  itemCount: exchangeRates.length,
                  itemBuilder: (context, index) {
                    final ExchangeRate = exchangeRates[index];
                    return ListTile(
                      title: Text(ExchangeRate.currency),
                      subtitle: Text(ExchangeRate.rate.toStringAsFixed(2)),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
