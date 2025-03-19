import 'package:donut_app_2b_carmona/tabs/burger_tab.dart';
import 'package:donut_app_2b_carmona/tabs/donut_tab.dart';
import 'package:donut_app_2b_carmona/tabs/pancakes_tab.dart';
import 'package:donut_app_2b_carmona/tabs/pizza_tab.dart';
import 'package:donut_app_2b_carmona/tabs/smoothie_tab.dart';
import 'package:donut_app_2b_carmona/utils/my_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> myTabs = [
    MyTab(IconPath: 'lib/icons/donut.png'),
    MyTab(IconPath: 'lib/icons/burger.png'),
    MyTab(IconPath: 'lib/icons/smoothie.png'),
    MyTab(IconPath: 'lib/icons/pancakes.png'),
    MyTab(IconPath: 'lib/icons/pizza.png'),
  ]; //lista d
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, //numero de elementos(tabs)
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          //Icono Izquierdo
          leading: Icon(Icons.menu, color: Colors.grey[800]),
          //Icono Derecho
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
              child: Icon(Icons.person, color: Colors.grey[800]),
            ),
          ],
        ),
        body: Column(
          children: [
            //texto principal
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: const [
                  Text("I Want to ", style: TextStyle(fontSize: 32)),
                  Text("Eat",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)), //tamano de letra y negrita
                ],
              ),
            ),

            //TabBar
            TabBar(tabs: myTabs),

            //TabBarView
            Expanded(
              child: TabBarView(
                children: [
                  DonutTab(),
                  BurgerTab(),
                  SmoothieTab(),
                  PancakesTab(),
                  PizzaTab(),
                ],
              ),
            ),

            //carrito
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(padding: EdgeInsets.only(left: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('2 Items | \$45',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Delivery charges included',
                  style: TextStyle(fontSize: 12),)

                ],

               )
                  ),
                  ElevatedButton(
                      onPressed: () {  },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.pink,
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12)),

                      child: const Text('View Cart',
                      style: TextStyle(color: Colors.white),),)

                ],

              ),
            ),
          ],
        ),
      ),
    );
  }
}