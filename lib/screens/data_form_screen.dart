import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/data_provider.dart';
import 'package:agricultura_app/screens/results_screen.dart';

class DataFormScreen extends StatefulWidget {
  @override
  _DataFormScreenState createState() => _DataFormScreenState();
}

class _DataFormScreenState extends State<DataFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phController = TextEditingController();
  final TextEditingController _soilController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final provider = Provider.of<DataProvider>(context, listen: false);

      provider.saveAndAnalyzeData(
        ph: double.parse(_phController.text.replaceAll(',', '.')),
        UmidadeSolo: double.parse(_soilController.text.replaceAll(',', '.')),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Dados salvos!")),
      );

      // Aguarda o Provider atualizar antes de navegar
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResultsScreen()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Entrada de Dados")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _phController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "pH do Solo"),
                validator: (v) {
                  if (v == null || v.isEmpty) return "Campo obrigatório";
                  double? val = double.tryParse(v.replaceAll(',', '.'));
                  if (val == null || val < 0 || val > 14)
                    return "Valor inválido";
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _soilController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Umidade do Solo (%)"),
                validator: (v) {
                  if (v == null || v.isEmpty) return "Campo obrigatório";
                  double? val = double.tryParse(v.replaceAll(',', '.'));
                  if (val == null || val < 0 || val > 100)
                    return "Valor inválido";
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: Text("Analisar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
