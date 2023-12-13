import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fodinha_flutter/widgets/atoms/circle_color.dart';
import 'package:fodinha_flutter/model/player/player.dart';
import 'package:fodinha_flutter/views/playerscreen/controller/playerscreen_controller.dart';

class AvatarDialogs extends StatelessWidget {
  final PlayerModel data;
  final List<String> avatarData;
  final PlayerScreenController controller;
  final VoidCallback? onSave;
  final VoidCallback? onCancel;

  const AvatarDialogs(
    {required this.data,
    required this.avatarData,
    required this.controller,
    this.onSave,
    this.onCancel, 
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 

    return Dialog(
        insetAnimationDuration: const Duration(milliseconds: 400),
        insetAnimationCurve: Curves.bounceIn,
        child: Column(
          children: [
            Observer(
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 15),
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        // tem como melhorar o avatar_player
                        Container(
                          child: controller.svg.contains(".svg")
                              ? SvgPicture.asset(
                                  controller.svg,
                                  width: 150,
                                  height: 150,
                                )
                              : controller.svg.contains("xmlns")
                              ? SvgPicture.string(
                                  controller.svg,
                                  width: 150,
                                  height: 150,
                                )
                              : CircleColor(
                                data: data,
                                width: 150,
                                height: 150,
                                labelSize: 32,
                                radius: 90,))
                      ],
                    ),
                  ),
                );
            },
          ),
          Text("Selecione o seu avatar",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Theme.of(context).colorScheme.primary
            )),
          Expanded(
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomScrollView(
                  shrinkWrap: true,
                  slivers: <Widget>[
                    SliverGrid(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      delegate: SliverChildBuilderDelegate((context, index) {
                          final avatar = avatarData[index];
                          return Padding(
                            padding: const EdgeInsets.all(8),
                            child: GestureDetector(
                              onTap: () {
                                if (avatar == "assets/random-avatar.svg") {
                                  controller.createRandomNewAvatar();                                 
                                  return;
                                }

                                if (avatar == "assets/camera-fotografica.svg") {
                                  controller.takePhoto();
                                  return;
                                }

                                if(avatar == "assets/galeria.svg"){
                                  controller.getImageFromGallery();
                                  return;
                                }
                                
                                controller.setPicture(avatar);
                              },
                              child: SvgPicture.asset(
                                avatar,
                                width: 80,
                                height: 80,
                              ),
                            ),
                          );
                        },
                        childCount: avatarData.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Future.delayed(const Duration(milliseconds: 600), () {
                          controller.setPicture("");
                        });
                      },
                      child: const Text("Cancelar")),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);                                                                   
                        onSave!();
                        Future.delayed(const Duration(milliseconds: 600), () {
                          controller.setPicture("");
                        });
                      },
                      child: const Text("Salvar")),
                ],
              ),
            )
          ],
        ),
      );
  }

  
}
