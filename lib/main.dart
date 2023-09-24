import 'package:flutter/material.dart';
// import 'package:flutter_sound/flutter_sound.dart'; // Make sure to import the FlutterSound package
// import 'package:audioplayers/audioplayers.dart'; // Make sure to import the AudioPlayer package

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        focusColor: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isRecording = false;

  // final FlutterSound flutterSound = FlutterSound();

  // AudioPlayer audioPlayer = AudioPlayer();

  String? recordedFilePath;
  List<String> todos = [];
  String input = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello To Do"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  title: Text("Add To Do List..!"),
                  content: TextField(onChanged: (String value) {
                    input = value;
                  }),
                  actions: <Widget>[
                    ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            todos.add(input);
                          });
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.add),
                        label: Text("Add")),
                  ],
                );
              });
        },
        child: Icon(
          Icons.add_task,
        ),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(todos[index]),
              direction: DismissDirection.none,
              onDismissed: (DismissDirection direction) {
                setState(() {
                  todos.removeAt(index);
                });
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                margin: EdgeInsets.all(8.0),
                elevation: 4.0,
                child: ListTile(
                  title: Text(todos[index]),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      _deleteItem(index);
                    },
                  ),
                ),
              ),
            );
          }),
    );
  }

  void _deleteItem(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }
}
