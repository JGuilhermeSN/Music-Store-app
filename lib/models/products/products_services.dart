import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:musicstore_app/models/products/products_store.dart';

class ProductsServices {
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;
  late CollectionReference firestoreRef;

  ProductsServices() {
    firestoreRef = _firebase.collection('Products');
  }

  Future<bool> add(Products products) async {
    try {
      await firestoreRef.add(products.toMap());
      return Future.value(true);
    } on FirebaseException catch (e) {
      if (e.code != 'OK') {
        debugPrint('Problemas ao inserir os dados');
      } else if (e.code == 'ABORTED') {
        debugPrint('Inclusão abortada');
      }
      return Future.value(false);
    }
  }

  Future<bool> delete(String individualId) async {
    try {
      await firestoreRef.doc(individualId).delete();
      return Future.value(true);
    } on FirebaseException catch (e) {
      if (e.code != 'OK') {
        debugPrint('Problemas ao deletar os dados');
      } else if (e.code == 'ABORTED') {
        debugPrint('Deleção abortada');
      }
      return Future.value(false);
    }
  }
}
