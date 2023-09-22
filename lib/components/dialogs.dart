import 'package:flutter/material.dart';

class Dialogs extends StatelessWidget {
  final String title;
  final String textDialog;
  final List<Widget> actions;

  const Dialogs({required this.actions, required this.title, required this.textDialog, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content:Text(textDialog),
      actions: actions
    );
  }
}
