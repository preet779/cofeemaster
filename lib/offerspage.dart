import 'package:flutter/material.dart';

class offerspage extends StatelessWidget {
  const offerspage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        offer(
          title: "my great offer ever",
          description: "buy one get one free",
        ),
        offer(
          title: "my great offer ever",
          description: "buy one get one free",
        ),
        offer(
          title: "my great offer ever",
          description: "buy one get one free",
        ),
        offer(
          title: "my great offer ever",
          description: "buy one get one free",
        ),
      ],
    );
  }
}

class offer extends StatelessWidget {
  final String title;
  final String description;
  const offer({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 7,
          color: Color.fromARGB(255, 220, 174, 21),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("images/background.png"))),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      color: Colors.amber,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          this.title,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        color: Colors.amber,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            this.description,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
