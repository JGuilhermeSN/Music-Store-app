import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:musicstore_app/models/products/products_services.dart';

class SalesScreen extends StatelessWidget {
  const SalesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductsServices _productsServices = ProductsServices();
    return Scaffold(
      body: StreamBuilder(
          stream: _productsServices.firestoreRef.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot docSnapshot = snapshot.data!.docs[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(children: [
                        Row(
                          children: [
                            const Text(
                              'Nome: \t',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              docSnapshot['name'],
                              style: const TextStyle(
                                fontSize: 16.5,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'Preço: \t',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              docSnapshot['price'],
                              style: const TextStyle(
                                fontSize: 16.5,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'Marca: \t',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              docSnapshot['brand'],
                              style: const TextStyle(
                                fontSize: 16.5,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'Tipo: \t',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              docSnapshot['type'],
                              style: const TextStyle(
                                fontSize: 16.5,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'Quantidade: \t',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              docSnapshot['quantity'],
                              style: const TextStyle(
                                fontSize: 16.5,
                              ),
                            )
                          ],
                        )
                      ]),
                    ),
                  );
                },
              );
            }
            return const Center(child: Text('Dados indisponiveis'));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/AddProductScreen');
        },
        backgroundColor: Colors.orange,
        child: const Icon(
          Icons.add_outlined,
          color: Colors.black,
        ),
      ),
    );
  }
}
