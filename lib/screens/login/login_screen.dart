import 'package:flutter/material.dart';
import 'package:musicstore_app/helpers/block_button.dart';
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
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/annie-spratt-violao_base.jpg',
                  ),
                  fit: BoxFit.cover)),
          child: Form(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: 200,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/images/static-no-backgound.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                    const Text(
                      "Bem vindo!",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
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
                          filled: true,
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(18),
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
                          filled: true,
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(18),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                            style: TextButton.styleFrom(),
                            onPressed: () {},
                            child: Text(
                              "Esqueci minha senha",
                              style: TextStyle(color: Colors.blue.shade700),
                            )),
                      ],
                    ),
                    const Divider(
                      height: 16,
                    ),
                    Column(
                      children: [
                        BlockButton(
                          label: const Text("Entrar"),
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
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BlockButton(
                            label: const Text("Cadastrar-se"),
                            onPressed: onPressed)
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        // BOTAO DE ENTRADA PARA TESTE, REMOVER EM SEGUIDA
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("/home");
                            },
                            child: const Text('TESTE'))
                      ],
                    )
                  ],
                ),
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
