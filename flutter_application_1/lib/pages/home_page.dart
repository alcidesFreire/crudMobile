import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/veiculo.dart';
import 'package:flutter_application_1/services/veiculo_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: FutureBuilder(
        future: getVeiculo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final veiculo = snapshot.data?[index] as Veiculo; // Use a classe Veiculo aqui
                return Dismissible(
                  onDismissed: (direction) async {
                    await deletaVeiculo(veiculo);
                    snapshot.data?.removeAt(index);
                  },
                  confirmDismiss: (direction) async {
                    bool result = false;
                    result = await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Tem certeza que deseja excluir o veículo: ${veiculo.nome}"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                return Navigator.pop(
                                  context,
                                  false,
                                );
                              },
                              child: const Text(
                                "Cancelar",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                return Navigator.pop(
                                  context,
                                  true,
                                );
                              },
                              child: const Text(
                                "Tenho certeza",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                    return result;
                  },
                  background: Container(
                    child: Icon(Icons.delete),
                    color: Colors.red,
                  ),
                  direction: DismissDirection.endToStart,
                  key: Key(veiculo.id ?? ""), // Utilize o ID da instância Veiculo
                  child: ListTile(
                    title: Text(veiculo.nome ?? ""),
                    subtitle: Text('Preço: ${veiculo.preco ?? ""}'),
                    onTap: () async {
                      await Navigator.pushNamed(
                        context,
                        '/editVeiculo',
                        arguments: {
                          "nome": veiculo.nome,
                          "preco": veiculo.preco,
                          "uid": veiculo.id,
                        },
                      );
                      setState(() {});
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/addVeiculo');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
