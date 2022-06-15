import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Carrinho de Compras",
        style: TextStyle(fontSize: 35),
      ),
    );
  }
}
