import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/pages/add_veiculo.dart';
import 'package:flutter_application_1/pages/edit_veiculo.dart';
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
     initialRoute: '/',   
     routes: {
     '/':(context) => const Home(),
     '/addVeiculo':(context) => const AddVeiculoPage(),
     '/editVeiculo':(context) => const EditVeiculoPage(),
     },
    );
  }
}

