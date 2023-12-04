import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class UsuarioService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> addUsuario(String email, String password) async {
    try {
      UserCredential credential =
          await _auth.createUserWithEmailAndPassword(email: email, password: password);

      // Verifica se o usuário foi criado com sucesso
      if (credential.user != null) {
        // Adiciona os dados do usuário à coleção 'usuario'
        await _firestore.collection('usuario').doc(credential.user!.uid).set({
          'email': email,
          'password': password,
          // Adicione outros campos conforme necessário
        });

        return credential.user;
      }
    } catch (e) {
      print('Ocorreu algum erro: $e');
    }

    return null;
  }

Future<User?> login(String email, String password) async {
  try {
    print('Tentando fazer login...');
    UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return credential.user;
  } catch (e) {
    print('Ocorreu algum erro durante o login: $e');
    return null;
  }
}
}