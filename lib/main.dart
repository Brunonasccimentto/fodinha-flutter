import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fodinha_flutter/view_model/gamescreen_view_model/gamescreen_view_model.dart';
import 'package:fodinha_flutter/view_model/player_view_model/player_view_model.dart';
import 'package:fodinha_flutter/views/gamescreen/gamescreen.dart';
import 'package:fodinha_flutter/views/gamescreen/gamescreen_endRound.dart';
import 'package:fodinha_flutter/feature/loadingscreen/loadingscreen.dart';
import 'package:fodinha_flutter/views/playerscreen/playerscreen.dart';
import 'package:fodinha_flutter/views/startscreen/startscreen.dart';
import 'package:provider/provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const AppWidget()));
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

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
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.indigo,
              accentColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 125, 139, 218),
              errorColor: const Color.fromARGB(255, 255, 27, 11)
            )
          ),         
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
