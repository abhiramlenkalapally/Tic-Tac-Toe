import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  List<String> _values = ["", "", "", "", "", "", "", "", ""];
  List<int> x = [];
  List<int> o = [];
  int count = 0;
  bool visibility = true;

  Widget result() {
    if ((x.contains(0) & x.contains(1) & x.contains(2)) |
        (x.contains(3) & x.contains(4) & x.contains(5)) |
        (x.contains(6) & x.contains(7) & x.contains(8)) |
        (x.contains(0) & x.contains(3) & x.contains(6)) |
        (x.contains(2) & x.contains(5) & x.contains(8)) |
        (x.contains(1) & x.contains(7) & x.contains(4)) |
        (x.contains(0) & x.contains(4) & x.contains(8)) |
        (x.contains(6) & x.contains(2) & x.contains(6))) {
      visibility = false;

      return Padding(
        padding: EdgeInsets.all(30),
        child: Container(
          color: Colors.white,
          height: 100,
          width: 300,
          child: Center(
            child: Text(
              "X WON",
              style: TextStyle(fontSize: 60, fontStyle: FontStyle.italic),
            ),
          ),
        ),
      );
    } else if ((o.contains(0) & o.contains(1) & o.contains(2)) |
        (o.contains(3) & o.contains(4) & o.contains(5)) |
        (o.contains(6) & o.contains(7) & o.contains(8)) |
        (o.contains(0) & o.contains(3) & o.contains(6)) |
        (o.contains(2) & o.contains(5) & o.contains(8)) |
        (o.contains(1) & o.contains(7) & o.contains(4)) |
        (o.contains(0) & o.contains(4) & o.contains(8)) |
        (o.contains(6) & o.contains(2) & o.contains(6))) {
      visibility = false;

      return Padding(
        padding: EdgeInsets.all(30),
        child: Container(
          color: Colors.white,
          height: 100,
          width: 300,
          child: Center(
            child: Text("O WON",
                style: TextStyle(fontSize: 60, fontStyle: FontStyle.italic)),
          ),
        ),
      );
    } else if (count == 9) {
      visibility = false;

      return Padding(
        padding: EdgeInsets.all(30),
        child: Container(
          color: Colors.white,
          height: 100,
          width: 300,
          child: Center(
            child: Text("DRAW",
                style: TextStyle(fontSize: 60, fontStyle: FontStyle.italic)),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

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
          child: Column(
            children: [
              Visibility(
                visible: visibility,
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
                        setState(
                          () {
                            count++;
                            print(index);
                            if (_tap) {
                              _values[index] = "X";
                              x.add(index);
                              _tap = false;
                            } else {
                              _values[index] = "O";
                              o.add(index);
                              _tap = true;
                            }
                            print(x);
                            print(o);
                          },
                        );
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
              result(),
              GestureDetector(
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Game())),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    color: Colors.white,
                    height: 100,
                    width: 300,
                    child: Center(
                      child: Text("Start a new game",
                          style: TextStyle(
                              fontSize: 35, fontStyle: FontStyle.italic)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
