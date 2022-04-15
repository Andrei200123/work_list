import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Список дел'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text('Главная страница'),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, '/todo');
              },
              child: Text('Некст'))
        ],
      ),
    );
  }
}
