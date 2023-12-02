import 'package:flutter/material.dart';
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
                final veiculo = snapshot.data?[index];
                return ListTile(
                  title: Text(veiculo?['nome']),
                  subtitle: Text('Preço: ${veiculo?['preco']}'),
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
      floatingActionButton: FloatingActionButton(onPressed: () async{
      await  Navigator.pushNamed(context, '/addVeiculo');
      setState(() {  });
      },
      child: const Icon(Icons.add),
      ),
    );
  }
}
