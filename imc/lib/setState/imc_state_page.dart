import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:imc/Widgts/imc_gauge.dart';
import 'package:imc/Widgts/img_gauge_range.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

class ImcStatePage extends StatefulWidget {
  const ImcStatePage({Key? key}) : super(key: key);

  @override
  State<ImcStatePage> createState() => _ImcStatePageState();
}

class _ImcStatePageState extends State<ImcStatePage> {
  final pesoEC = TextEditingController();
  final alturaEC = TextEditingController();
  final fomrkey = GlobalKey<FormState>();
  var imc = 0.0;

  Future<void> _calcularImc(
      {required double peso, required double altura}) async {
    setState(() {
      imc = 0;
    });
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      imc = peso / pow(altura, 2);
    });
  }

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
          child: Form(
        key: fomrkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ImcGauge(imc: imc),
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
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Peso Obrigatório';
                  }
                },
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
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'altura Obrigatório';
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Altura'),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    var formValid = fomrkey.currentState?.validate ?? false;

                    if (formValid) {
                      var formatter = NumberFormat.simpleCurrency(
                          locale: 'pt_BR', decimalDigits: 2);
                      double peso = formatter.parse(pesoEC.text) as double;
                      double altura = formatter.parse(alturaEC.text) as double;
                      _calcularImc(peso: peso, altura: altura);
                    }
                  },
                  child: Text('Calcular IMD')),
            ],
          ),
        ),
      )),
    );
  }
}
