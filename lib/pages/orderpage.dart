import 'package:flutter/material.dart';

import '../datamanager.dart';

class orderpage extends StatelessWidget {
  final Datamanager datamanager;
  const orderpage({Key? key, required this.datamanager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(children: [
        Container(
          color: Colors.orange,
          height: 500,
        ),
        Container(
          color: Colors.white30,
          height: 205,
        ),
        Container(
          color: Colors.green,
          height: 200,
        )
      ]),
    ]);
  }
}
