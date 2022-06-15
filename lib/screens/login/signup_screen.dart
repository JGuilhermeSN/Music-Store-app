import 'package:flutter/material.dart';
import 'package:musicstore_app/helpers/validator.dart';
import 'package:musicstore_app/user/user_local.dart';
import 'package:musicstore_app/user/user_services.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final UserLocal userLocal = UserLocal();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Center(
          heightFactor: 1.75,
          child: Container(
            height: 500,
            width: 350,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  const Text(
                    "Cadastro",
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
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(
                            left: 20, right: 20, top: 30, bottom: 10),
                        labelText: 'Nome',
                        isDense: true,
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(),
                          child: Icon(Icons.person),
                        )),
                    validator: (name) {
                      if (name!.isEmpty) {
                        return 'Campo obrigatório';
                      } else if (name.trim().split(' ').length <= 1) {
                        return 'Preencha seu nome completo';
                      }
                      return null;
                    },
                    onSaved: (name) => userLocal.name = name,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
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
                    validator: (email) {
                      if (email!.isEmpty) {
                        return 'Campo Obrigatório';
                      } else if (!emailValidator(email)) {
                        return 'Email inválido';
                      }
                      return null;
                    },
                    // salva no email
                    onSaved: (email) => userLocal.email = email,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
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
                    validator: (password) {
                      if (password!.isEmpty) {
                        return 'Campo obrigatório';
                      } else if (password.length < 6) {
                        return 'A senha deve ter ao menos 6 caracteres';
                      }
                      return null;
                    },
                    onSaved: (password) => userLocal.password = password,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(
                            left: 20, right: 20, top: 30, bottom: 10),
                        labelText: "Digite novamente a senha",
                        isDense: true,
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(),
                          child: Icon(Icons.key),
                        )),
                    validator: (password) {
                      if (password!.isEmpty) {
                        return 'Campo obrigatório';
                      } else if (password.length < 6) {
                        return 'A senha deve ter ao menos 6 caracteres';
                      }
                      return null;
                    },
                    onSaved: (password) => userLocal.confirmPassword = password,
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
                            if (formkey.currentState!.validate()) {
                              //chama os metodos onSave de cada um dos formsfields
                              //os campos devem conter o onsave habilitado
                              formkey.currentState!.save();
                              if (userLocal.password !=
                                  userLocal.confirmPassword) {
                                const ScaffoldMessenger(
                                    child: SnackBar(
                                  content: Text(
                                    'Senhas não coincidentes',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  backgroundColor: Colors.red,
                                ));
                                return;
                              }
                              UserServices userServices = UserServices();
                              userServices.signUp(userLocal, onSucces: () {
                                Navigator.of(context).pop();
                              }, onFail: (e) {
                                ScaffoldMessenger(
                                    child: SnackBar(
                                  content: Text(
                                    'Falha no registro de usuário: $e',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ));
                              });
                            }
                          },
                          child: const Text("Cadastrar")),
                      const SizedBox(height: 20),
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
}
