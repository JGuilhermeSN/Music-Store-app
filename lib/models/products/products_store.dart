import 'package:cloud_firestore/cloud_firestore.dart';

class Products {
  String? id;
  String? name;
  String? price;
  String? brand; // marca
  String? type;
  String? quantity;

  //construtor
  Products({
    this.id,
    this.name,
    this.price,
    this.brand,
    this.type,
    this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'brand': brand,
      'type': type,
      'quantity': quantity,
    };
  }

  //metodo de armazanamento dos dados vindos do firebase
  Products.fromDocument(DocumentSnapshot doc) {
    id = doc.id;
    name = doc.get('name');
    price = doc.get('price');
    brand = doc.get('brand');
    type = doc.get('type');
    quantity = doc.get('quantity');
  }

/*
  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
      price: map['price'] ?? '',
      brand: map['brand'] ?? '',
      type: map['type'] ?? '',
      quantity: map['quantity'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Products.fromJson(String source) =>
      Products.fromMap(json.decode(source));

  @override
  String toString() =>
      'Products price:  price, brand: $brand, type: $type, quantity: $quantity)';*/
}
