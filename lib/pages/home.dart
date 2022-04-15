import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {
  List WorkList = [];
  String WorkElement = '';

  void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  void initState() {
    //super.initState();
    //initFirebase();
    WorkList.addAll(['Work 1', 'Work 2', 'Work 3']);
  }

  void MenuOpen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            centerTitle: true,
            title: Text('Меню'),
          ),
          body: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.amberAccent),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/', (route) => false);
                      },
                      child: Text('На главную', style: TextStyle(fontSize: 25),),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      style:
                      ElevatedButton.styleFrom(primary: Colors.amberAccent),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/todo', (route) => false);
                      },
                      child: Text('К списку', style: TextStyle(fontSize: 25),),
                    ),
                  ),
                ],
              ),
            ),
          ));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Список дел'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: MenuOpen,
          )
        ],
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
                      setState(() {
                        WorkList.removeAt(index);
                      });
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
                  title: Text('Добавить запись'),
                  content: TextField(
                    onChanged: (String value) {
                      setState(() {
                        WorkElement = value;
                      });
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            WorkList.add(WorkElement);
                          });
                          // FirebaseFirestore.instance.collection('items').add({
                          //     'item': WorkElement});
                          Navigator.of(context).pop();
                        },
                        child: Text("Сейв"))
                  ],
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
