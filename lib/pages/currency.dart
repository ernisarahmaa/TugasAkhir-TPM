import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrencyPage extends StatefulWidget {
  @override
  _CurrencyPageState createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  double riyalToRupiah = 3980.0; // Nilai tukar Riyal ke Rupiah
  double dollarToRupiah = 14865.0; // Nilai tukar Dolar ke Rupiah
  double yuanToRupiah = 2109.0; // Nilai tukar Yuan ke Rupiah

  String selectedCurrency = 'Riyal';
  double inputAmount = 0.0;
  double convertedAmount = 0.0;

  void convertCurrency() {
    setState(() {
      switch (selectedCurrency) {
        case 'Riyal':
          convertedAmount = inputAmount * riyalToRupiah;
          break;
        case 'Dollar':
          convertedAmount = inputAmount * dollarToRupiah;
          break;
        case 'Yuan':
          convertedAmount = inputAmount * yuanToRupiah;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Amount',
              ),
              onChanged: (value) {
                setState(() {
                  inputAmount = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              value: selectedCurrency,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCurrency = newValue!;
                });
              },
              items: ['Riyal', 'Dollar', 'Yuan'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: convertCurrency,
              child: Text('Convert'),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Converted Amount:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10.0),
            Text(
              NumberFormat.currency(locale: 'id_ID', symbol: 'Rp').format(convertedAmount),
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
