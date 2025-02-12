import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  final String IconPath;
  const MyTab({super.key, required this.IconPath});

  @override
  Widget build(BuildContext context) {
    return Tab(
    height:50, 
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[200],
      ),
      
      child:Image.asset(IconPath,color: Colors.grey[600])));
  }
}