import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/data_provider.dart';
import 'package:agricultura_app/screens/login_screen.dart';
import 'package:agricultura_app/screens/configuracao_screen.dart';
import 'package:agricultura_app/screens/home_screen.dart';

class ResultsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Resultados")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Dados Coletados:"),
            Text("pH: ${data.ph ?? 'N/A'}"),
            Text("Umidade: ${data.UmidadeSolo ?? 'N/A'}%"),
            SizedBox(height: 20),
            Text("Recomendações:"),
            Text(data.recommendation ?? "Nenhuma análise"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Voltar"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, 
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            ); // Direciona ao login (Não contém nada)
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            ); // Direciona ao Home
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConfiguracaoScreen(),
              ),
            ); // Direciona ao Configurações (não contém nada)
          }

          // Botões para mudar de tela
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],
      ),
    );
  }
}
