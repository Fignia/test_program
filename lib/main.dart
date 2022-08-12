import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final Random _random = Random();

  Color _color = const Color(0xFFFFFFFF);

  void changeColor(){
    setState((){
      _color = Color.fromARGB(
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test Program'),
          backgroundColor: Colors.orange,
        ),
        body: InkWell(
          onTap: changeColor,
          child: Container(
            color: _color,
            child:  Center(
                child:
                ElevatedButton.icon(label: const Text('Hey There =)'),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SecondRoute())
                      );
                    },
                    icon: const Icon(Icons.ac_unit))
            ),
          ),
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Center(
            child: Hero(
              tag: 'imageHero',
              child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Salto_del_Angel-Canaima-Venezuela08.JPG/1200px-Salto_del_Angel-Canaima-Venezuela08.JPG'),
            ),
          ),
        )
    );


  }

}
