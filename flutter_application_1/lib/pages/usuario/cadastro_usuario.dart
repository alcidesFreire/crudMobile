import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/usuario/usuario_service.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  UsuarioService uService = UsuarioService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () async {
                User? newUser = await uService.addUsuario(
                  _emailController.text,
                  _passwordController.text,
                );

                if (newUser != null) {
                  print('Usuário criado com sucesso: ${newUser.email}');
                  // Navigator.pop(context);
                  // Navigator.pushReplacementNamed(context, '/login');
                } else {
                  print('Erro ao criar o usuário');
                }
              },
              child: const Text('Criar Usuário'),
            ),
          ],
        ),
      ),
    );
  }
}
