import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:musicstore_app/screens/home/homepage.dart';
import 'package:musicstore_app/screens/login/login_screen.dart';
import 'package:musicstore_app/screens/login/signup_screen.dart';
import 'firebase_options.dart';
import 'models/products/AddProduct_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Musicando',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login', // define a tela inicial do app,
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/signup': (context) => const SignupScreen(),
        '/AddProductScreen': (context) => const AddProductScreen(),
      },
    );
  }
}
