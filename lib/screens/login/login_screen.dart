// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:musicstore_app/screens/home/homepage.dart';
import 'package:musicstore_app/user/user_local.dart';
import 'package:musicstore_app/user/user_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  UserLocal userLocal = UserLocal();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Center(
          heightFactor: 1.75,
          child: Container(
            height: 350,
            width: 350,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  const Text(
                    "Bem vindo!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onSaved: (value) => userLocal.email = value,
                    initialValue: userLocal.email,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(
                            left: 20, right: 20, top: 30, bottom: 10),
                        labelText: 'Email',
                        isDense: true,
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(),
                          child: Icon(Icons.email_outlined),
                        )),
                    validator: (value) {
                      if (value == null) {
                        return 'Email obrigatório';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onSaved: (value) => userLocal.password = value,
                    initialValue: userLocal.password,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(
                            left: 20, right: 20, top: 30, bottom: 10),
                        labelText: "Senha",
                        isDense: true,
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(),
                          child: Icon(Icons.key),
                        )),
                    validator: (value) {
                      if (value == null) {
                        return 'Senha necessária';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(height: 30),
                      ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              _formkey.currentState!.save();
                              UserServices _userServices = UserServices();
                              _userServices.signIn(userLocal, onSucces: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()));
                              }, onFail: (e) {
                                Text('$e');
                              });
                            }
                          },
                          child: const Text("Entrar")),
                      const SizedBox(height: 20),
                      ElevatedButton(
                          onPressed: onPressed, child: const Text("Cadastrar")),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  onPressed() {
    Navigator.of(context).pushNamed("/signup");
  }
}
