import 'package:flutter/material.dart';
import 'package:fodinha_flutter/view_model/gamescreen_view_model.dart';
import 'package:fodinha_flutter/view_model/player_view_model.dart';
import 'package:fodinha_flutter/views/gamescreen/gamescreen.dart';
import 'package:fodinha_flutter/views/gamescreen/gamescreen_endRound.dart';
import 'package:fodinha_flutter/feature/loadingscreen/loadingscreen.dart';
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
        Provider<GamescreenViewModel>.value(
        value: GamescreenViewModel()),
        
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo),
              iconTheme: const IconThemeData(color: Colors.white70),
              textTheme:
                  const TextTheme(displayLarge: TextStyle(color: Colors.white))),
          initialRoute: "/",
          routes: {
            "/": (BuildContext context) => const StartScreen(),
            "/LoadingScreen": (BuildContext context) => const LoadingScreen(),
            "/PlayerScreen":(BuildContext context) => const PlayerScreen(),
            "/GameScreen": (BuildContext context) => const GameScreen(),
            "/GameScreenEndRound": (BuildContext context) => const GameScreenEndRound(),
          }),
    );
  }
}
