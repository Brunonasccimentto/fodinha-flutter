
import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  final double? childAspectRatio;
  final int? crossAxisCount;
  final int itemCount;
  final Widget child;

  const Grid({ super.key, this.childAspectRatio, required this.itemCount, required this.child, this.crossAxisCount });

   @override
   Widget build(BuildContext context) {
    return GridView.builder(                
      itemCount: itemCount,                
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount ?? 2,
        childAspectRatio: childAspectRatio ?? 1), 
      itemBuilder: (context, index) {
        return child;
      });
  }
}