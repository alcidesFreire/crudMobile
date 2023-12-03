import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/veiculo_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Veículos'),
        backgroundColor: Colors.blue, // Cor de fundo da AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
          future: getVeiculo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  final veiculo = snapshot.data?[index];
        
                  return Dismissible(
                    onDismissed: (direction) async {
                      await deletaVeiculo(snapshot.data?[index]['uid']);
                      snapshot.data?.removeAt(index);
                    },
                    confirmDismiss: (direction) async {
                      bool result = false;
                      result = await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Tem certeza de que quer excluir o veículo ${snapshot.data?[index]['nome']}?"),
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
                                  "Sim, excluir",
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
                      color: Colors.red,
                      child: const Icon(Icons.delete),
                    ),
                    direction: DismissDirection.endToStart,
                    key: Key(snapshot.data?[index]['uid']),
                    child: Card(
                      elevation: 4, // Elevação do card
                      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: ListTile(
                        title: Text(veiculo?['nome']),
                        subtitle: Text('Preço: ${veiculo?['preco']}'),
                        onTap: () async {
                          await Navigator.pushNamed(
                            context,
                            '/editVeiculo',
                            arguments: {
                              "nome": snapshot.data?[index]['nome'],
                              "preco": snapshot.data?[index]['preco'],
                              "uid": snapshot.data?[index]['uid'],
                            },
                          );
                          setState(() {});
                        },
                      ),
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
