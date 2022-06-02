import 'dart:convert';

import 'datamodel.dart';
import 'package:http/http.dart' as http;

class Datamanager {
  List<catagory>? _menu;
  List<itemcart> cart = [];

  fetchmenu() async {
    const url = "https://firtman.github.io/coffeemasters/api/menu.json";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      _menu = [];
      var decodedData = jsonDecode(response.body) as List<dynamic>;
      for (var json in decodedData) {
        _menu?.add(catagory.fromJson(json));
      }
    }
  }

  Future<List<catagory>> getMenu() async {
    if (_menu == null) {
      await fetchmenu();
    }
    return _menu!;
  }

  cartadd(Product p) {
    bool found = false;
    for (var item in cart) {
      if (item.product.id == p.id) {
        item.quantity++;
        found = true;
      }
      if (!found) {
        cart.add(itemcart(product: p, quantity: 1));
      }
    }
  }

  cartremove(Product p) {
    cart.removeWhere((item) => item.product.id == p.id);
  }

  cartclear() {
    cart.clear();
  }

  double carttotal() {
    double total = 0;
    for (var item in cart) {
      total = total + item.quantity * item.product.price;
    }
    return total;
  }
}
