import 'package:flutter/material.dart';
import 'package:musicstore_app/models/products/products_services.dart';
import 'package:musicstore_app/models/products/products_store.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final Products _products = Products();
  final ProductsServices _productsServices = ProductsServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: const Text('Novo Indivíduo'),
        titleTextStyle: const TextStyle(
          fontSize: 18,
          // color: ,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    label: const Text('Nome'),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: Colors.black,
                      ),
                    ),
                    labelStyle: const TextStyle(fontSize: 18),
                    contentPadding: const EdgeInsets.all(18),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black)),
                  ),
                  validator: (name) {
                    if (name!.isEmpty) {
                      return 'o Campo deve ser preenchido';
                    }
                    return null;
                  },
                  onSaved: (name) => _products.name = name,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: const Text('Preço'),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: Colors.black,
                      ),
                    ),
                    labelStyle: const TextStyle(fontSize: 18),
                    contentPadding: const EdgeInsets.all(18),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black)),
                  ),
                  validator: (price) {
                    if (price!.isEmpty) {
                      return 'o Campo deve ser preenchido';
                    }
                    return null;
                  },
                  onSaved: (price) => _products.price = price,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    label: const Text('Marca'),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: Colors.black,
                      ),
                    ),
                    labelStyle: const TextStyle(fontSize: 18),
                    contentPadding: const EdgeInsets.all(18),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black)),
                  ),
                  validator: (brand) {
                    if (brand!.isEmpty) {
                      return 'o Campo deve ser preenchido';
                    }
                    return null;
                  },
                  onSaved: (brand) => _products.brand = brand,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    label: const Text('Tipo'),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: Colors.black,
                      ),
                    ),
                    labelStyle: const TextStyle(fontSize: 18),
                    contentPadding: const EdgeInsets.all(18),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black)),
                  ),
                  validator: (type) {
                    if (type!.isEmpty) {
                      return 'o Campo deve ser preenchido';
                    }
                    return null;
                  },
                  onSaved: (type) => _products.type = type,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    label: const Text('Quantidade'),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: Colors.black,
                      ),
                    ),
                    labelStyle: const TextStyle(fontSize: 18),
                    contentPadding: const EdgeInsets.all(18),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black)),
                  ),
                  validator: (quantity) {
                    if (quantity!.isEmpty) {
                      return 'o Campo deve ser preenchido';
                    }
                    return null;
                  },
                  onSaved: (quantity) => _products.quantity = quantity,
                ),
                const SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              _formkey.currentState!.save();
                              bool ok = await _productsServices.add(_products);
                              if (ok && mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        backgroundColor: Colors.green,
                                        content: Text(
                                            'Dados inseridos com sucesso')));
                                _formkey.currentState!.reset();
                                Navigator.of(context).pop();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text(
                                            'Problemas ao inserir dados')));
                              }
                            }
                          },
                          child: const Text('Adicionar'),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: 150,
                        child: ElevatedButton(
                          style: const ButtonStyle(),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
