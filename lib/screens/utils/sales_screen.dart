import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:musicstore_app/models/products/cart_storage.dart';
import 'package:musicstore_app/models/products/products_services.dart';
import 'package:musicstore_app/models/products/products_store.dart';

class SalesScreen extends StatelessWidget {
  SalesScreen({Key? key}) : super(key: key);
  final ProductsServices _productsServices = ProductsServices();
  final List _products = [];
  late CartStorage cart;

  final TextEditingController _controller = TextEditingController();

  late int _quantidade = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder<QuerySnapshot>(
        stream: _productsServices.getProducts(),
        builder: ((BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<DocumentSnapshot> docSnap = snapshot.data!.docs;
            return ListView.separated(
                itemBuilder: (context, index) {
                  return Center(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(docSnap[index].get('marca')),
                                  Text(docSnap[index].get('tipo')),
                                  Text(docSnap[index].get('preco').toString()),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      int i = checkCart(docSnap[index].id);
                                      if (i == -1) {
                                        cart.products.add(Products(
                                          id: docSnap[index].id,
                                          marca: docSnap[index].get("marca"),
                                          tipo: docSnap[index].get("tipo"),
                                          quantidade:
                                              docSnap[index].get("quantidade"),
                                        ));
                                      } else {
                                        if (cart.products[i].quantidade <
                                            docSnap[index].get("quantidade")) {
                                          cart.products[i].quantidade += 1;
                                          if (cart.products[i].quantidade! >
                                              docSnap[index]
                                                  .get("quantidade")) {
                                            cart.products[i].quantidade =
                                                docSnap[index]
                                                    .get("quantidade");
                                          }
                                        }
                                      }
                                    },
                                    child: const Text('Adicionar ao Carrinho')),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  child: Text(
                                    "No carrinho: $_quantidade",
                                  ),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      int valor = int.parse(_controller.text);
                                      if (valor > 1) {
                                        valor--;
                                      }
                                      _controller.text = valor.toString();
                                    },
                                    child: const Text('Remover do Carrinho')),
                              ],
                            ),
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            child: const Text("Finalizar compra"))
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Column(
                    children: const [
                      SizedBox(height: 10),
                      Divider(),
                    ],
                  );
                },
                itemCount: docSnap.length);
          } else if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else {
            return const Text("Nenhum produto registrado.");
          }
        }),
      ),
    ));
  }

  int checkCart(String id) {
    for (int i = 0; i < _products.length; i++) {
      if (id == _products[i].id) {
        return i;
      }
    }
    return -1;
  }
}
