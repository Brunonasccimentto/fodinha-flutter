

import 'dart:math';

import 'package:random_avatar/random_avatar.dart';

class MainListController {
  late String svgCode;

  _randomString(){
    const alphabet = 'abcdefghijklmnopqrstuvwxyz';
    const maxLength = 8;
    final length = Random().nextInt(maxLength + 1);

     String randomStringGenerated = '';

    for (int i = 0; i < length; i++) {
      final randomIndex = Random().nextInt(alphabet.length);
      randomStringGenerated += alphabet[randomIndex];
    }

    return randomStringGenerated;
  }

  createNewAvatar(){
    svgCode = RandomAvatarString(_randomString());
    return svgCode;
  }
}