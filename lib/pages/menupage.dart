import 'package:cofeemaster1/datamanager.dart';
import 'package:flutter/material.dart';

import '../datamodel.dart';

class menupage extends StatelessWidget {
  final Datamanager datamanager;

  const menupage({Key? key, required this.datamanager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var p = Product(id: 1, name: "dummy", price: 12.44, image: "");
    return ListView(
      children: [
        productitem(
          product: p,
          onAdd: () {},
        ),
        productitem(
          product: p,
          onAdd: () {},
        ),
        productitem(
          product: p,
          onAdd: () {},
        ),
      ],
    );
  }
}

class productitem extends StatelessWidget {
  final Product product;
  final Function onAdd;
  const productitem({Key? key, required this.product, required this.onAdd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "images/black_coffee.png",
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                product.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0, bottom: 14.0),
              child: Text("\$${product.price}"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 18.0, left: 18.0, right: 18.0),
                  child: ElevatedButton(
                    onPressed: () {
                      onAdd(product);
                    },
                    child: Text("Add"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
