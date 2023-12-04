import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/veiculo/veiculo_service.dart';

class AddVeiculoPage extends StatefulWidget {
  const AddVeiculoPage({super.key,});

  @override
  State<AddVeiculoPage> createState() => _AddVeiculoPageState();
}

class _AddVeiculoPageState extends State<AddVeiculoPage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController precoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Veiculo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                hintText: 'Insira o nome do veículo',
              ),
            ),
            const SizedBox(height: 40),
            TextField(
              controller: precoController,
              decoration: const InputDecoration(
                hintText: 'Insira o preço do veículo',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
               
                await addVeiculo(nomeController.text, precoController.text)
                    .then((_) {
                  Navigator.pop(context);
                });
              },
              child: const Text('Salvar'),
            )
          ],
        ),
      ),
    );
  }
}
