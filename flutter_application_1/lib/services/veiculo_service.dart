import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/veiculo.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List<Veiculo>>getVeiculo() async{
  List<Veiculo> veiculos = [];
  CollectionReference collectionReferenceVeiculo = db.collection('veiculo');

  QuerySnapshot queryVeiculo = await collectionReferenceVeiculo.get();
  for (var doc in queryVeiculo.docs){
    Veiculo veiculo = Veiculo.fromJson(doc);
  // final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  
 
    veiculos.add(veiculo);
  }

  return veiculos;
}

//create
Future<void>addVeiculo(String nome, String preco)async{
  await db.collection("veiculo").add({"nome": nome, "preco": preco});
}

//update
Future<void> atualizaVeiculo(String uid, String novoNome, String novoPreco) async{
  await db.collection("veiculo").doc(uid).update({"nome": novoNome, "preco": novoPreco});

}

Future<void> deletaVeiculo(Veiculo veiculo) async {
  await db.collection("veiculo").doc(veiculo.id).delete();
}


