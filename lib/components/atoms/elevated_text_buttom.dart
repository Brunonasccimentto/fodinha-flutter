import 'package:flutter/material.dart';

class ElevatedTextButtonDefault extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const ElevatedTextButtonDefault({ required this.onPressed, required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 10,
        backgroundColor: Colors.indigo,  
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),  
        fixedSize: Size(MediaQuery.of(context).size.width / 2.3, 50),     
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
      ),
      onPressed: onPressed, 
      child: Text(text,
      style: const TextStyle(
        color: Colors.white
      ),)
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