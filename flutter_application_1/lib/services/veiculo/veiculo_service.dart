import 'package:cloud_firestore/cloud_firestore.dart';


FirebaseFirestore db = FirebaseFirestore.instance;

Future<List>getVeiculo() async{
  List veiculos = [];
  CollectionReference collectionReferenceVeiculo = db.collection('veiculo');

  QuerySnapshot queryVeiculo = await collectionReferenceVeiculo.get();
  for (var doc in queryVeiculo.docs){

 final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
 final veiculoJson = {
  "nome": data['nome'],
  "preco": data['preco'],
  "uid": doc.id,
 };
  
 
    veiculos.add(veiculoJson);
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

Future<void> deletaVeiculo(String uid) async {
  await db.collection("veiculo").doc(uid).delete();
}