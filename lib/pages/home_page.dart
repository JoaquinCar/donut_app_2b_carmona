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
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Lista de Tabs
  List<Widget>  myTabs=[
    MyTab(IconPath: 'lib/icons/donut.png'),
    MyTab(IconPath: 'lib/icons/burger.png'),
    MyTab(IconPath: 'lib/icons/smoothie.png'),
    MyTab(IconPath: 'lib/icons/pancakes.png'),
    MyTab(IconPath: 'lib/icons/pizza.png'),
  ];

  // Estado del carrito
  List<Map<String, dynamic>> cartItems = []; // Lista de elementos en el carrito
  double totalPrice = 0.0; // Precio total

  // Función para agregar un elemento al carrito
  void addToCart(String name, double price) {
    setState(() {
      cartItems.add({"name": name, "price": price});
      totalPrice += price;
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:5,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            //icono izq
            leading: Icon(
              Icons.menu,
              color:Colors.grey[850],
            ),
            //icono derecho
            actions: const[
              Padding(
                padding: EdgeInsets.only(right: 22.0),
                child: Icon(Icons.person),
              )
            ],

          ),
          body:Column(children:[
            //Texto principal
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 16),
              child: Row(
                children: [
                  Text("I want to ", style: TextStyle(fontSize: 30)),
                  Text("Eat", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, decoration: TextDecoration.underline))//Tamañ
                ],
              ),
            ),

            //TabBar
            TabBar(tabs: myTabs),


            //TabBarView
            Expanded(
              child: TabBarView(children:[
                DonutTab(addToCart: addToCart),
                BurgerTab(addToCart: addToCart),
                SmoothieTab(addToCart: addToCart),
                PancakesTab(addToCart: addToCart),
                PizzaTab(addToCart: addToCart),
              ]
              ),
            ),



            //Carrito
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(14),
              child: Row(
                //Poner los elementos en los extremos de la fila
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 26),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${cartItems.length} items | \$${totalPrice.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text("Delivery Charges Included",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink[200],
                          padding: EdgeInsets.symmetric(
                              horizontal: 9,
                              vertical: 10
                          )
                      ),
                      child: Text('View Cart',
                          style: TextStyle(color: Colors.black)
                      )
                  )
                ],
              ),
            )
          ],
          )
      ),
    );
  }
}