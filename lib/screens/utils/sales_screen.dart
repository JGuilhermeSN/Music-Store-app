import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:musicstore_app/models/products/cart_storage.dart';
import 'package:musicstore_app/models/products/products_services.dart';
import 'package:musicstore_app/models/products/products_store.dart';
import 'package:musicstore_app/screens/utils/cart_screen.dart';

class SalesScreen extends StatefulWidget {
  SalesScreen({Key? key}) : super(key: key);

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  final ProductsServices _productsServices = ProductsServices();

  final List _products = [];

  late CartStorage cart;

  // final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    cart = CartStorage(products: _products);
    // _controller.text = "0";
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _productsServices.getProducts(),
              builder: ((BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<DocumentSnapshot> docSnap = snapshot.data!.docs;
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        final TextEditingController _controller =
                            TextEditingController();
                        _controller.text = "0";
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
                                        Text(docSnap[index]
                                            .get('preco')
                                            .toString()),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            int valor =
                                                    int.parse(_controller.text),
                                                maximo = docSnap[index]
                                                    .get("quantidade");
                                            if (valor < maximo) {
                                              valor++;
                                            }
                                            _controller.text = valor.toString();
                                          },
                                          child: const Text(' + ')),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            int valor =
                                                int.parse(_controller.text);
                                            if (valor > 1) {
                                              valor--;
                                            }
                                            _controller.text = valor.toString();
                                          },
                                          child: const Text(' - ')),
                                    ],
                                  ),
                                ],
                              ),
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
                                            docSnap[index].get("quantidade")) {
                                          cart.products[i].quantidade =
                                              docSnap[index].get("quantidade");
                                        }
                                      }
                                    }
                                  },
                                  child: const Text("Adicionar ao carrinho")),
                              TextFormField(
                                controller: _controller,
                              ),
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
          ),
          ElevatedButton(
              onPressed: onPressed, child: const Text("Finalizar compra"))
        ],
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

  onPressed() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CartScreen(
        cart: cart,
      ),
    ));
  }
}
