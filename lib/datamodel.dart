class Product {
  int id;
  String name;
  double price;
  String image;
  String get imageurl =>
      "https://firtman.github.io/coffemasters/api/images/$image";
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'] as int,
        name: json['name'] as String,
        price: json['price'] as double,
        image: json['image'] as String);
  }
}

class catagory {
  String name;
  List<Product> products;
  catagory({required this.name, required this.products});
  factory catagory.fromJson(Map<String, dynamic> json) {
    var productsJson = json['products'] as Iterable<dynamic>;
    var products = productsJson.map((p) => Product.fromJson(p)).toList();
    return catagory(name: json['name'] as String, products: products);
  }
}

class itemcart {
  Product product;
  int quantity;
  itemcart({required this.product, required this.quantity});
}
