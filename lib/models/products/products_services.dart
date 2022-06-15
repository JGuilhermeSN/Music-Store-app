import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:musicstore_app/models/products/products_store.dart';

class ProductsServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  addProducts(Products products) {
    _firestore.collection("products").add(products.toMap());
  }

  updateProducts(Products products) {
    _firestore.collection("products").doc(products.id).update(products.toMap());
  }

  deleteProduct(Products products) {
    _firestore.collection("products").doc(products.id).delete();
  }

  Stream<QuerySnapshot> getProducts() {
    return _firestore.collection("products").snapshots();
  }
}
