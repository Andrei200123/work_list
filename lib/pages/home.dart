import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List WorkList = [];
  String WorkElement = '';

  @override
  void initState() {
    super.initState();
    WorkList.addAll(['Work 1', 'Work 2', 'Work 3']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Список дел'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: WorkList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(WorkList[index]),
              child: Card(
                child: ListTile(
                  title: Text(WorkList[index]),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete_sweep,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      WorkList.removeAt(index);
                    },
                  ),
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  WorkList.removeAt(index);
                });
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    title: Text('Добавить херню!'),
                    content: TextField(
                      onChanged: (String value) {
                        setState(() {
                          WorkElement = value;
                        });
                      },
                    ),
                  actions: [ElevatedButton(onPressed: () {
                    setState(() {
                      WorkList.add(WorkElement);
                    });
                    Navigator.of(context).pop();
                  }, child: Text("Сейв"))],
                );
              });
        },
        child: const Icon(
          Icons.add_circle,
        ),
      ),
    );
  }
}
