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
    return Container(
      decoration: BoxDecoration(
        color: donutColor,
        borderRadius: BorderRadius.circular(10),
        
      ),
    );
  }
}