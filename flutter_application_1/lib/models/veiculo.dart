import 'package:cloud_firestore/cloud_firestore.dart';
class Veiculo{
  String? id;
  String? nome;
  String? preco;

  Veiculo({
this.id,
this.nome,
this.preco
});

Map<String, dynamic> toJson(){
  return {
    'id': id,
    'nome': nome,
    'preco': preco,
};
}

Veiculo.fromJson(DocumentSnapshot doc){
  id = doc.id;
  nome = doc.get('nome');
  preco = doc.get('preco');
}

}
