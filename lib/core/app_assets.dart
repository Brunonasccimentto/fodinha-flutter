import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class AppAssets {
   LottieBuilder trophy = Lottie.asset(
    'assets/trophy.json',
    height: 250,                        
    repeat: true,
  );

  LottieBuilder fireworks = Lottie.asset(
    'assets/fireworks.json',
    height: 500,                
    repeat: true,
  );

  Image crown = Image.asset(
    "assets/crown.png",
    width: 80,
    height: 30,
    scale: 0.2,             
  );

  Image adaptiveIcon = Image.asset(
    "assets/adaptive-icon.png"
  );

}