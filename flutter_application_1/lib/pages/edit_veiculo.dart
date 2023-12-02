import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/veiculo_service.dart';

class EditVeiculoPage extends StatefulWidget {
  const EditVeiculoPage({super.key});

  @override
  State<EditVeiculoPage> createState() => _EditVeiculoPageState();
}

class _EditVeiculoPageState extends State<EditVeiculoPage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController precoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    nomeController.text = arguments['nome'];
    precoController.text = arguments['preco'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('edit veiculo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                hintText: 'Insira o novo nome do veículo',
              ),
            ),
            const SizedBox(height: 40),
            TextField(
              controller: precoController,
              decoration: const InputDecoration(
                hintText: 'Insira o novo preço do veículo',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: ()async {
           
              await atualizaVeiculo(arguments['uid'], nomeController.text, precoController.text).then((value){
                Navigator.pop(context);
              });
              
              }, 
          
              child: const Text('Atualizar'))
          ],
        ),
      ),
    );
  }
}
