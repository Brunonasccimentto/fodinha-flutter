import 'package:flutter/material.dart';

class AppScreen extends StatelessWidget {
  final List<Widget> widgets;
  final Color? backgroundColor;
  final MainAxisAlignment? aligment;

  const AppScreen({super.key, required this.widgets, this.backgroundColor, this.aligment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: aligment ?? MainAxisAlignment.start,        
            children: widgets,
          ),
        ),
      ),
    );
  }
}