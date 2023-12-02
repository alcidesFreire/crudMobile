import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List>getVeiculo() async{
  List veiculo = [];
  CollectionReference collectionReferenceVeiculo = db.collection('veiculo');

  QuerySnapshot queryVeiculo = await collectionReferenceVeiculo.get();
  queryVeiculo.docs.forEach((documento) {
    veiculo.add(documento.data());

   });

  return veiculo;
}

//create
Future<void>addVeiculo(String nome, String preco)async{
  await db.collection("veiculo").add({"nome": nome, "preco": preco});
}

