import 'package:flutter/material.dart';

class DonutTile extends StatelessWidget {
  final String donutFlavor;
  final String donutPrice;
  final dynamic donutColor; //dynamic es un tipo de dato que puede ser cualquier tipo de dato
  final String donutImage;

  const DonutTile({super.key, 
    required this.donutFlavor,
    required this.donutPrice,
    required this.donutColor,
    required this.donutImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding( padding: const EdgeInsets.all(12.0),
        child: Container(
      decoration: BoxDecoration(
        color: donutColor[100],
        borderRadius: BorderRadius.circular(24),

    ),
       child: Column(
         children: [
           //priceTag
           Row(mainAxisAlignment: MainAxisAlignment.end,
           children: [Container(
             decoration: BoxDecoration(color:donutColor[200],
           borderRadius: BorderRadius.only(
             topRight: Radius.circular(24),bottomLeft: Radius.circular(24),)),
             padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 18),
             child: Text('\$$donutPrice',
               style: TextStyle(
                   fontWeight: FontWeight.bold,fontSize: 18,color: donutColor[800]),
             ),
             ),]
             ,),

           //DonutImage
           Padding(padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 24),
           child: Image.asset(donutImage),
           )

           //info

           //fav and add icon
         ],
       ),
      ),
    );
  }
}