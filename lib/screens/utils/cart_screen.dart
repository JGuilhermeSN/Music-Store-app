import 'package:flutter/material.dart';
import 'package:musicstore_app/models/products/cart_storage.dart';

class CartScreen extends StatelessWidget {
  late CartStorage cart;
  CartScreen({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cart.finalAmount();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 161, 94, 18),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              const Text("Valor da compra:"),
              // Text("${cart.amount}"),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Comprar")),
            ],
          ),
        ),
      ),
    );
  }
}
