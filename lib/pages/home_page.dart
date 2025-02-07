import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Free Donuts'),
        backgroundColor: Colors.transparent,
        //Icono Izquierdo
        leading: Icon
        (Icons.menu,
         color: Colors.grey[800]),
        //Icono Derecho
        actions: [
          Icon(Icons.person,
          color: Colors.grey[800]),
        ],
      ),
    );
  }
}
