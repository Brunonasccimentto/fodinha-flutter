import 'package:flutter/material.dart';
import 'package:fodinha_flutter/views/playerscreen.dart';
import 'package:fodinha_flutter/views/startscreen.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo),
            textTheme:
                const TextTheme(displayLarge: TextStyle(color: Colors.white))),
        initialRoute: "/",
        routes: {
          "/": (BuildContext context) => const StartScreen(),
          "/PlayerScreen":(BuildContext context) => const PlayerScreen(),
        });
  }
}
