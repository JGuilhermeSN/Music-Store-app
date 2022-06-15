import 'dart:convert';

class Products {
  double? preco;
  String? id;
  String? marca;
  String? tipo;
  int? quantidade;

  //construtor
  Products({
    this.id,
    this.preco,
    this.marca,
    this.tipo,
    this.quantidade,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'preco': preco});
    result.addAll({'marca': marca});
    result.addAll({'tipo': tipo});
    result.addAll({'quantidade': quantidade});

    return result;
  }

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
      preco: map['preco'] ?? '',
      marca: map['marca'] ?? '',
      tipo: map['tipo'] ?? '',
      quantidade: map['quantidade'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Products.fromJson(String source) =>
      Products.fromMap(json.decode(source));

  @override
  String toString() =>
      'Products preco:  preco, marca: $marca, tipo: $tipo, quantidade: $quantidade)';
}
