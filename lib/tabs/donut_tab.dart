import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {
  //lista de donas 
  final List donutsOnSale = [
    //[donutFlavor,donutPrice,donutColor,ImageName]
    ["Ice Cream", "36", Colors.blue, "lib/images/icecream_donut.png"],
    ["Strawberry", "45", Colors.pink, "lib/images/strawberry_donut.png"],
    ["Grape Ape", "84", Colors.purple, "lib/images/grape_donut.png"],
    ["Choco", "95", Colors.brown, "lib/images/chocolate_donut.png"],
 
  ];
  DonutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder( 
      //el gridview.builder es un widget que crea una cuadricula de elementos
      //elementos en nuestra lista
      itemCount: donutsOnSale.length, //numero de elementos en la lista
      padding: const EdgeInsets.all(10), //espacio entre los elementos
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( //crea una cuadricula con un numero fijo de columnas
        crossAxisCount: 2, //numero de columnas
        crossAxisSpacing: 10, //espacio entre columnas
        mainAxisSpacing: 10, //espacio entre filas
      ),
      itemBuilder: (context, index) {
        return DonutTile(
          donutFlavor: donutsOnSale[index][0],
          donutPrice: donutsOnSale[index][1],
          donutColor: donutsOnSale[index][2],
          donutImage: donutsOnSale[index][3],
        );
      },
    );
  }
}