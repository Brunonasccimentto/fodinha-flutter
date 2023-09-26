import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fodinha_flutter/constants/avatar.dart';
import 'package:fodinha_flutter/controller/player_controller.dart';
import 'package:fodinha_flutter/model/player.dart';
import 'package:mobx/mobx.dart';

class MainList extends StatefulWidget {
  List<PlayerModel> data;

  MainList({required this.data, Key? key}) : super(key: key);

  @override
  State<MainList> createState() => _MainListState();
}

class _MainListState extends State<MainList> {
  @override
  Widget build(BuildContext context) {
    const avatarData = avatar;
    final controller = PlayerController();

    return Center(
    child: widget.data.isEmpty
        ? const Text("Nenhum jogador")
        : GridView.builder(
            itemCount: widget.data.length,
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    widget.data[index].dealer ? 
                    Image.asset(
                      "assets/crown.png",
                      width: 80,
                      height: 34,
                    )
                    : const SizedBox(height: 34),
                    GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => Dialog(
                              insetAnimationDuration:
                                  const Duration(milliseconds: 400),
                              insetAnimationCurve: Curves.bounceIn,
                              child: Column(
                                children: [
                                  Observer(
                                    builder: (BuildContext context) {
                                      return Container(
                                        margin: const EdgeInsets.symmetric(vertical: 40),
                                        child: controller.svg.contains(".svg") ? 
    
                                        SvgPicture.asset(
                                          controller.svg,
                                          width: 150,
                                          height: 150)
                                          : controller.svg.contains("<") ? 
    
                                        SvgPicture.string(
                                          controller.svg,
                                          width: 150,
                                          height: 150)
    
                                        : ClipRRect(
                                          borderRadius: BorderRadius.circular(90),
                                          child: Container(
                                            width: 150,
                                            height: 150,
                                            color: Color(widget.data[index].color),
                                            alignment: Alignment.center,
                                            child: Text(widget.data[index].name.substring(0, 2).toUpperCase(),
                                            style: const TextStyle(color: Colors.white,
                                            fontSize: 34)),
                                          ),
                                          )
                                        );
                                    },
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: CustomScrollView(
                                        shrinkWrap: true,
                                        slivers: <Widget>[
                                          SliverGrid(
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 4,
                                            ),
                                            delegate:
                                                SliverChildBuilderDelegate(
                                              (context, index) {
                                                final avatar =
                                                    avatarData[index];
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      if (avatar == "assets/random-avatar.svg") {
                                                        controller.createRandomNewAvatar();
                                                        return;
                                                      }
    
                                                      controller.setSvg(avatar);
                                                    },
                                                    child: SvgPicture.asset(
                                                      avatar,
                                                      width: 50,
                                                      height: 50,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
    
                                              Future.delayed(
                                                  const Duration(
                                                      milliseconds: 400), () {
                                                controller.setSvg("");
                                              });
                                            },
                                            child: const Text("Cancelar")),
                                        TextButton(
                                            onPressed: () async {
                                              Navigator.pop(context);
                                              await controller.updatePhoto(widget.data[index], controller.svg);
                                            },
                                            child: const Text("Salvar")),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        child: widget.data[index].photo.contains(".svg")
                            ? SvgPicture.asset(
                                widget.data[index].photo,
                                width: 80,
                                height: 80,
                              )
                            : widget.data[index].photo.contains("<")
                                ? SvgPicture.string(
                                    widget.data[index].photo,
                                    width: 80,
                                    height: 80,
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      color: Color(widget.data[index].color),
                                      alignment: Alignment.center,
                                      child: Text(
                                        widget.data[index].name
                                            .substring(0, 2)
                                            .toUpperCase(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 24),
                                      ),
                                    ),
                                  )),
                    Text(widget.data[index].name)
                  ],
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
          ),
      );
  }
}
