import 'package:flutter/material.dart';
import 'package:fodinha_flutter/view_model/player_view_model.dart';
import 'package:fodinha_flutter/views/playerscreen/playerscreen.dart';
import 'package:fodinha_flutter/views/startscreen/startscreen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PlayerViewModel>.value(
          value: PlayerViewModel()),
        
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo),
              textTheme:
                  const TextTheme(displayLarge: TextStyle(color: Colors.white))),
          initialRoute: "/",
          routes: {
            "/": (BuildContext context) => const StartScreen(),
            "/PlayerScreen":(BuildContext context) => const PlayerScreen(),
          }),
    );
  }
}