import 'package:flutter/material.dart';
import '../utils/donut_tile.dart';
import '../utils/pizza_tile.dart';

class PizzaTab extends StatelessWidget {
  final List pizzaOnSale = [
    // [pizza, pizzaPrice, pizzaColor, imageName],
    ["Peperoni","Krispy Kreme", "36", Colors.blue, "lib/images/basicpizza.png"],
    ["Spicy Peperoni","Dunkin pizzas","45", Colors.red,"lib/images/lovepizza.png"],
    ["Vegetables","Costco","84", Colors.purple,"lib/images/mexicanpizza.png"],
    ["Mix","Walmart","95", Colors.brown, 'lib/images/mixpizza.png'],
    ["Extra cheese","Krispy Kreme", "36", Colors.blue, "lib/images/peperonipizza.png"],
    ["Extra Extra cheese","Dunkin pizzas","45", Colors.red,"lib/images/slicepizza.png"],
    ["Simple","Costco","84", Colors.purple,"lib/images/chessepizza.png"],
    ["ChocoHongo","Walmart","95", Colors.brown, 'lib/images/italianpizza.png'],
  ];
  final Function(String, double) addToCart;

  PizzaTab({super.key, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    //Acomodar elementos en Cuadricula
    return GridView.builder(
      //Eementos en nuestra lista
        itemCount: pizzaOnSale.length,
        padding: const EdgeInsets.all(8.0),
        //Organiza como distribuir
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //numero de columnas
            crossAxisCount: 2,
            childAspectRatio: 1/1.5
        ),
        itemBuilder: (context, index){
          var pizzaTile = PizzaTile(
            pizzaFlavor: pizzaOnSale[index][0],
            pizzaStore: pizzaOnSale[index][1],
            pizzaPrice: pizzaOnSale[index][2],
            imageName: pizzaOnSale[index][4],
            pizza: pizzaOnSale[index][3],
            addToCart: addToCart,

          );
          return pizzaTile;
        }
    );
  }
}