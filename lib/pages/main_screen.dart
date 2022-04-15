import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 10), child: Text(
              "Здесь должно быть какое-то описание...", style: TextStyle(fontSize: 25),
            ),),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.amberAccent),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/todo');
                  },
                  child: Text('К списку дел')),
            )
          ],
        ),
      ),
    );
  }
}
