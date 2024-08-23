import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FuelCalculator extends StatefulWidget {
  @override
  _FuelCalculatorState createState() => _FuelCalculatorState();
}

class _FuelCalculatorState extends State<FuelCalculator> {
  final _alcoholController = TextEditingController();
  final _gasolineController = TextEditingController();
  String _result = '';
  IconData _resultIcon = Icons.info; // Ícone padrão
  Color _backgroundColor = Colors.grey[200]!; // Cor padrão do fundo

  void _calculate() {
    double? alcoholPrice = double.tryParse(_alcoholController.text.replaceAll(',', '.'));
    double? gasolinePrice = double.tryParse(_gasolineController.text.replaceAll(',', '.'));

    print('Álcool: $alcoholPrice, Gasolina: $gasolinePrice'); // Log para depuração

    if (alcoholPrice != null && gasolinePrice != null && gasolinePrice > 0 && alcoholPrice > 0) {
      double ratio = alcoholPrice / gasolinePrice;

      print('Razão: $ratio'); // Log para depuração

      setState(() {
        if (ratio < 0.7) {
          _result = 'Abasteça com Álcool';
          _resultIcon = Icons.local_drink;
          _backgroundColor = Colors.green[100]!; // Fundo verde claro para álcool
        } else {
          _result = 'Abasteça com Gasolina';
          _resultIcon = Icons.local_gas_station;
          _backgroundColor = Colors.red[100]!; // Fundo vermelho claro para gasolina
        }
      });
    } else {
      _showErrorDialog();
    }
  }

  void _clear() {
    _alcoholController.clear();
    _gasolineController.clear();
    setState(() {
      _result = '';
      _resultIcon = Icons.info; // Ícone padrão após limpar
      _backgroundColor = Colors.grey[200]!; // Cor padrão do fundo
    });
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Erro'),
          content: Text('Por favor, insira valores válidos.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Álcool ou Gasolina?'),
      ),
      body: Container(
        color: _backgroundColor, // Cor de fundo da tela
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _alcoholController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Preço do Álcool',
                border: OutlineInputBorder(),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              controller: _gasolineController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Preço da Gasolina',
                border: OutlineInputBorder(),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.local_gas_station),
                  label: Text('Calcular'),
                  onPressed: _calculate,
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.clear),
                  label: Text('Limpar'),
                  onPressed: _clear,
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _resultIcon,
                  size: 50,
                  color: (_result == 'Abasteça com Álcool') ? Colors.green : (_result == 'Abasteça com Gasolina') ? Colors.red : Colors.grey,
                ),
                SizedBox(width: 10),
                Text(
                  _result,
                  style: TextStyle(
                    fontSize: 24,
                    color: (_result == 'Abasteça com Álcool') ? Colors.green : Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
