import 'package:flutter/material.dart';

class AppScreen extends StatelessWidget {
  final List<Widget> widgets;
  final Color? backgroundColor;
  final MainAxisAlignment? aligment;
  final AppBar? appbar;

  const AppScreen({super.key, required this.widgets, this.backgroundColor, this.aligment, this.appbar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
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