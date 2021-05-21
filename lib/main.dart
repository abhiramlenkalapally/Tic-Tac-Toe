import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _tap = false;
  Widget sendImage() {
    if (_tap == true) {
      return Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                "https://icon-library.net/images/close-icon-png/close-icon-png-21.jpg",
              ),
              fit: BoxFit.cover),
        ),
      );
    } else {
      return Container(
        width: 300,
        height: 300,
        color: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text("Tic-Tac-Toe"),
      ),
      body: Container(
        color: Colors.indigo,
        child: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _tap = true;
              });
            },
            child: sendImage(),
          ),
        ),
      ),
    );
  }
}
