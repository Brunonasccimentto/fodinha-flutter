import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fodinha_flutter/constants/avatar.dart';
import 'package:fodinha_flutter/controller/main_list.controller.dart';
import 'package:fodinha_flutter/model/player.dart';

class MainList extends StatelessWidget {
  final List<PlayerModel> data;
  final avatarData = avatar; 

  const MainList({required this.data, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = MainListController();

    return Center(
      child: data.isEmpty
          ? const Text("Nenhum jogador")
          : GridView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final player = data[index];
                return Container(                          
                  alignment: Alignment.center,
                  child: Column(                   
                    children: [
                    player.dealer ? 
                      Image.asset("assets/crown.png")
                      : const SizedBox(height: 24),
                    GestureDetector(
                      onTap: (){
                        controller.createNewAvatar();
                        print(avatarData[2]);
                        showDialog(
                      context: context,
                      builder: (BuildContext context) => Dialog(
                            child: Column(                            
                              children: [
                                SvgPicture.string(
                                  controller.svgCode,
                                  width: 150,
                                  height: 150,
                                ),                               
                               
                                
                              ],
                            )
                          ));
                        },
                      child: CircleAvatar(
                        backgroundColor: Color(player.color),
                        child: Text(player.name.substring(0, 2).toUpperCase()),
                      ),
                    ),
                    Text(player.name)
                  ],),
                );
              }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            ),
    );
  }
}
