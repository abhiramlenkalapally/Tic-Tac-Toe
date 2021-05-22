import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

List<String> _values = ["", "", "", "", "", "", "", "", ""];
List<int> _checklist = [10, 11, 11, 11, 11, 11, 11, 11, 11];
int _checkIndex = 0;
// ignore: unused_element
bool _check = true;

bool checkIfClicked(int _check) {}

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
  bool _tap = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text("Tic-Tac-Toe"),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    print(index);
                    _check = checkIfClicked(index);
                    if (_check) {
                      if (_tap) {
                        _values[index] = "X";
                        _tap = false;
                      } else {
                        _values[index] = "O";
                        _tap = true;
                      }
                    }

                    _checkIndex++;
                    //print(_checkIndex);
                  });
                },
                child: Container(
                  color: Colors.white,
                  child: Text(
                    _values[index],
                    style: TextStyle(fontSize: 130),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
