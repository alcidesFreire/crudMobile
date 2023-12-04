import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/pages/usuario/cadastro_usuario.dart';
import 'package:flutter_application_1/pages/usuario/login_page.dart';
import 'package:flutter_application_1/pages/veiculo/add_veiculo.dart';
import 'package:flutter_application_1/pages/veiculo/edit_veiculo.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Material app',
      debugShowCheckedModeBanner: false,
     initialRoute: '/',   
     routes: {
      '/':(context) =>   const LoginPage(),
      '/home':(context) => const Home(),
      '/addUsuario':(context) =>   SignupPage(),
     '/addVeiculo':(context) => const AddVeiculoPage(),
     '/editVeiculo':(context) => const EditVeiculoPage(),
     },
    );
  }
}

