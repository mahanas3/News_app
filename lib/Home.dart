import 'package:flutter/material.dart';
import 'package:news_app/services/firesrore_services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: FutureBuilder(
          future: UserRepository().getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              print('fgvbhnj');
              return ListView.builder(
                itemCount: snapshot.data,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(snapshot.data[0]),
                      )
                    ],
                  );
                },
              );
            }
            return Text('vgbhnjm');
          }),
    );
  }
}
