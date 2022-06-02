import 'package:cofeemaster1/datamanager.dart';
import 'package:flutter/material.dart';

import 'offerspage.dart';
import 'pages/menupage.dart';
import 'pages/orderpage.dart';

void main() {
  runApp(const MyApp());
}

class greet extends StatefulWidget {
  const greet({Key? key}) : super(key: key);

  @override
  State<greet> createState() => _greetState();
}

class _greetState extends State<greet> {
  var name = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "hello $name",
          style: TextStyle(fontSize: 24),
        ),
        Padding(
          padding: const EdgeInsets.all(80.0),
          child: TextField(
              style: TextStyle(
                  color: Colors.amber,
                  backgroundColor: Colors.black,
                  fontSize: 120),
              onChanged: (value) => setState(() {
                    name = value;
                  })),
        ),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee Masters',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var datamanager = Datamanager();
  var selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    Widget currentpage = Text("hello");

    switch (selectedindex) {
      case 0:
        currentpage = menupage(
          datamanager: datamanager,
        );
        break;
      case 1:
        currentpage = offerspage();
        break;
      case 2:
        currentpage = orderpage(
          datamanager: datamanager,
        );
        break;
    }
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("images/logo.png"),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedindex,
          onTap: (newindex) {
            setState(() {
              selectedindex = newindex;
            });
          },
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.amber,
          selectedFontSize: 16,
          items: [
            BottomNavigationBarItem(label: "Menu", icon: Icon(Icons.coffee)),
            BottomNavigationBarItem(
                label: "Offer", icon: Icon(Icons.local_offer)),
            BottomNavigationBarItem(
                label: "Order",
                icon: Icon(Icons.shopping_cart_checkout_outlined)),
          ]),
      body: currentpage,
    );
  }
}
