import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.menu),
              tooltip: 'Menu Icon',
              onPressed: () {},
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.settings),
                tooltip: 'Comment Icon',
                onPressed: () {},
              ),
            ],
            backgroundColor: Color.fromARGB(255, 0, 205, 208)),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              new Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_circle_left_rounded,
                    color: Color.fromARGB(255, 0, 205, 208),
                    size: 50,
                  ),
                  tooltip: 'back Icon',
                  onPressed: () {},
                  style: IconButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              new Row(
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: new Image.asset(
                      'Assets/images/user.png',
                      height: 140.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  new Column(
                    children: <Widget>[
                      new Container(
                        margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Zayn Bryce',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                      new Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        alignment: Alignment.topLeft,
                        child: Text('bryce12 \nDoctor,\nCalifornia, USA.',
                            style: TextStyle(fontSize: 15)),
                      ),
                      new Container(
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.all(10),
                              side: BorderSide(color: Colors.black, width: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ) //<-- SEE HERE
                              ),
                          onPressed: () {},
                          icon: Icon(
                            // <-- Icon
                            Icons.person_add_alt,
                            color: Colors.black,
                            size: 26.0,
                          ),
                          label: Text('Add ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black)), // <-- Text
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              new Column(
                children: <Widget>[
                  new Container(
                    color: Color.fromARGB(255, 0, 205, 208),
                    margin: EdgeInsets.fromLTRB(12, 30, 12, 0),
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                    alignment: Alignment.center,
                    child: Text(
                      'Family Members',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              new Container(
                margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
                padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 0, 205, 208).withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Column(
                          children: <Widget>[
                            new Container(
                              margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
                              child: Image.asset(
                                'Assets/images/kyla.png',
                                height: 90.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            new Container(
                              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              // alignment: Alignment.center,
                              child: Text(
                                'Kyla',
                                // textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            new Container(
                              margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
                              //   alignment: Alignment.center,
                              child: Text('Wife',
                                  //     textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15)),
                            ),
                          ],
                        ),
                        new Column(
                          children: <Widget>[
                            new Container(
                              margin: EdgeInsets.fromLTRB(25, 30, 0, 0),
                              child: Image.asset(
                                'Assets/images/father.png',
                                height: 90.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            new Container(
                              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              // alignment: Alignment.center,
                              child: Text(
                                'Alex',
                                // textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            new Container(
                              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              //   alignment: Alignment.center,
                              child: Text('Father',
                                  //     textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15)),
                            ),
                          ],
                        ),
                        new Column(
                          children: <Widget>[
                            new Container(
                              margin: EdgeInsets.fromLTRB(25, 30, 0, 0),
                              child: Image.asset(
                                'Assets/images/child.png',
                                height: 90.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            new Container(
                              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              // alignment: Alignment.center,
                              child: Text(
                                'Andria',
                                // textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            new Container(
                              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              //   alignment: Alignment.center,
                              child: Text('son',
                                  //     textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    new Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.all(10),
                            side: BorderSide(color: Colors.black, width: 2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ) //<-- SEE HERE
                            ),
                        onPressed: () {},
                        icon: Icon(
                          // <-- Icon
                          Icons.add_circle_outline,
                          color: Colors.black,
                          size: 26.0,
                        ),
                        label: Text('Add Family Member',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black)), // <-- Text
                      ),
                    ),
                  ],
                ),
              ),
              new Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                      shadowColor:
                          Color.fromARGB(255, 0, 205, 208).withOpacity(0.5),
                      padding: EdgeInsets.all(10),
                      side: BorderSide(
                          color: Color.fromARGB(255, 0, 205, 208), width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ) //<-- SEE HERE
                      ),
                  onPressed: () {},
                  icon: Icon(
                    // <-- Icon
                    Icons.folder,
                    color: Color.fromARGB(255, 66, 65, 65),
                    size: 50.0,
                  ),
                  label: Text('MY Documents',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black)), // <-- Text
                ),
              ),
              new Container(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 0, 205, 208),
                    primary: Colors.black87,
                    minimumSize: Size(88, 36),
                    padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Document Access',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
