import 'package:flutter/material.dart';

class ElevatedTextButtonDefault extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Icon? icon;
  const ElevatedTextButtonDefault({ required this.onPressed, required this.text, this.icon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        elevation: 10,
        backgroundColor: Colors.indigo,  
         
        fixedSize: Size(MediaQuery.of(context).size.width / 2.2, 50),     
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
      ),
      onPressed: onPressed, 
      icon: icon ?? Container(),
      label: Text(text,
        style: const TextStyle(
          color: Colors.white
        )), 
    );
  }
}

// ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   elevation: 10,
//                   padding: const EdgeInsets.symmetric(horizontal: 40),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)) 
//                 ),
//                 onPressed: () {
//                   Navigator.pushNamed(context, "/PlayerScreen");
//                 }, 
//                 child: const Text("Começar"))