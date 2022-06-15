class CartStorage {
  late double amount;
  String? id;
  List products = [];

  CartStorage({
    // this.amount,
    this.id,
    required this.products,
  });

  finalAmount() {
    double result = 0;
    for (int i = 0; i < products.length; i++) {
      result = products[i].price;
    }
    amount = result;
  }

  CartStorage.fromMap(Map<String, dynamic> map)
      : amount = map["amount"],
        products = map["products"];
}
