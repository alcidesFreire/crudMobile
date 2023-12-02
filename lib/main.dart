import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material app',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
          // Nenhuma cor de fundo definida aqui para usar a cor padrão do tema Material
        ),
        body: const Center(
          child: Text("Hello, World!"),
        ),
      ),
    );
  }
}
