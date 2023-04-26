import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Map<String, dynamic>> places = [
    {
      'image': 'assets/place1.jpg',
      'name': 'Place 1',
    },
    {
      'image': 'assets/place2.jpg',
      'name': 'Place 2',
    },
    {
      'image': 'assets/place3.jpg',
      'name': 'Place 3',
    },
    {
      'image': 'assets/place4.jpg',
      'name': 'Place 4',
    },
    {
      'image': 'assets/place5.jpg',
      'name': 'Place 5',
    },
    {
      'image': 'assets/place6.jpg',
      'name': 'Place 6',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(places.length, (index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(places[index]['name']),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      places[index]['image'],
                      height: 80,
                      width: 80,
                    ),
                    SizedBox(height: 10),
                    Text(
                      places[index]['name'],
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String placeName;

  DetailScreen(this.placeName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: Center(
        child: Text('Detail Screen for $placeName'),
      ),
    );
  }
}
