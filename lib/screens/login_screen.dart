import 'package:agricultura_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:agricultura_app/screens/configuracao_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"), 
      ),
      body: const Center(
        child: Text("Tela de Login - Em construção"), 
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, 
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConfiguracaoScreen(),
              ),
            ); 
          }

          // Botões para mudar de pagina(Está criando nova)
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
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
