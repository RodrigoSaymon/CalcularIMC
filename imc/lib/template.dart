

import 'package:flutter/material.dart';
import 'package:imc/Widgts/imc_gauge.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

class ImcStatePage extends StatefulWidget {
  const ImcStatePage({Key? key}) : super(key: key);

  @override
  State<ImcStatePage> createState() => _ImcStatePageState();
}

class _ImcStatePageState extends State<ImcStatePage> {
  final pesoEC = TextEditingController();
  final alturaEC = TextEditingController();

  @override
  void disposer() {
    pesoEC.dispose();
    alturaEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC Setstate'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ImcGauge(imc: 0),
            
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: pesoEC,
              inputFormatters: [
                CurrencyTextInputFormatter(
                  locale: 'pt_BR',
                  symbol: '',
                  decimalDigits: 2,
                  turnOffGrouping: true,
                ),
              ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Peso'),
            ),
            TextFormField(
              controller: alturaEC,
              inputFormatters: [
                CurrencyTextInputFormatter(
                  locale: 'pt_BR',
                  symbol: '',
                  decimalDigits: 2,
                  turnOffGrouping: true,
                ),
              ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Altura'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {}, child: Text('Calcular IMD')),
          ],
        ),
      )),
    );
  }
}
