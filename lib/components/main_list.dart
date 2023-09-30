import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fodinha_flutter/constants/avatar.dart';
import 'package:fodinha_flutter/views/controller/playerscreen_controller.dart';
import 'package:provider/provider.dart';
import '../view_model/player_view_model.dart';

class MainList extends StatefulWidget {
 
 const MainList({ Key? key}) : super(key: key);

  @override
  State<MainList> createState() => _MainListState();
}

class _MainListState extends State<MainList> {
  @override
  Widget build(BuildContext context) {
    const avatarData = avatar;
    var store = Provider.of<PlayerViewModel>(context);
    var pageController = Provider.of<PlayerScreenController>(context);
    
    return Center(
    child: Column(
      children: [
        Observer(
            builder: (BuildContext context) { 
              return store.playerList.isEmpty
              ? const Text("Nenhum jogador")
              : GridView.builder(
                  shrinkWrap: true,
                  itemCount: store.playerList.length,
                  itemBuilder: (context, index) {
                    return Draggable(
                      onDragStarted: () {                                             
                        pageController.updateSize();   
                      },
                      onDraggableCanceled: (velocity, offset){
                        pageController.updateSize();                       
                      },
                                      
                      data: store.playerList[index].playerID,
                      childWhenDragging: Container(),                
                      feedback: Container(                      
                        alignment: Alignment.center,                      
                        child: Column(
                          children: [
                            store.playerList[index].dealer ? 
                            Image.asset(
                              "assets/crown.png",
                              width: 80,
                              height: 34,
                              scale: 0.2,
                            )
                            : const SizedBox(height: 34),
                            Container(                             
                              child: store.playerList[index].photo.contains(".svg") ? 
                                  SvgPicture.asset(
                                    store.playerList[index].photo,
                                    width: 80,
                                    height: 80,
                                  )
                                : store.playerList[index].photo.contains("<") ? 
                                  SvgPicture.string(
                                    store.playerList[index].photo,
                                    width: 80,
                                    height: 80,
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      color: Color(store.playerList[index].color),
                                        alignment: Alignment.center,
                                        child: Text(store.playerList[index].name.substring(0, 2).toUpperCase(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 24),
                                        ),
                                      ),
                                  ),
                            ),
                            
                          ],
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            store.playerList[index].dealer ? 
                            Image.asset(
                              "assets/crown.png",
                              width: 80,
                              height: 34,
                              scale: 0.2,
                            )
                            : const SizedBox(height: 34),
                            GestureDetector(                      
                              onLongPress: (){
                                store.setDealer(store.playerList[index].playerID);                       
                              },
                              onTap: () {
                                if(store.playerList[index].photo != ""){
                                  pageController.setSvg(store.playerList[index].photo);
                                }                       
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => Dialog(
                                    insetAnimationDuration: const Duration(milliseconds: 400),
                                    insetAnimationCurve: Curves.bounceIn,
                                    child: Column(
                                      children: [
                                        Observer(
                                          builder: (BuildContext context) {
                                            return Container(
                                              margin: const EdgeInsets.symmetric(vertical: 40),
                                              child: pageController.svg.contains(".svg") ? 
                                                
                                                SvgPicture.asset(
                                                  pageController.svg,
                                                  width: 150,
                                                  height: 150)
                                                  : pageController.svg.contains("<") ? 
                                                  
                                                SvgPicture.string(
                                                  pageController.svg,
                                                  width: 150,
                                                  height: 150)
                                                  
                                                : ClipRRect(
                                                  borderRadius: BorderRadius.circular(90),
                                                  child: Container(
                                                    width: 150,
                                                    height: 150,
                                                    color: Color(store.playerList[index].color),
                                                    alignment: Alignment.center,
                                                    child: Text(store.playerList[index].name.substring(0, 2).toUpperCase(),
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
                                                                pageController.createRandomNewAvatar();
                                                                return;
                                                              }
                              
                                                              if(avatar == "assets/camera-fotografica.svg"){
                                                                  //todo
                                                                return;
                                                              }
                                
                                                              pageController.setSvg(avatar);
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
                                                        pageController.setSvg("");
                                                      });
                                                    },
                                                    child: const Text("Cancelar")),
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      store.updatePhoto(store.playerList[index].playerID, pageController.svg);
                                                      pageController.setSvg("");
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
                                child: store.playerList[index].photo.contains(".svg") ? 
                                    SvgPicture.asset(
                                      store.playerList[index].photo,
                                      width: 80,
                                      height: 80,
                                    )
                                  : store.playerList[index].photo.contains("<") ? 
                                    SvgPicture.string(
                                      store.playerList[index].photo,
                                      width: 80,
                                      height: 80,
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Container(
                                        width: 80,
                                        height: 80,
                                        color: Color(store.playerList[index].color),
                                          alignment: Alignment.center,
                                          child: Text(store.playerList[index].name.substring(0, 2).toUpperCase(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 24),
                                          ),
                                        ),
                                    )
                            ),
                            Text(store.playerList[index].name,
                            style: const TextStyle(color: Colors.white)),
                            
                          ],
                        ),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                );
            },
         
        ),

        GestureDetector(
          onTap: () => pageController.updateSize(),
          child: ColoredBox(
            color: Colors.amberAccent,
            child: AnimatedSize(
              curve: Curves.easeIn,
              duration: const Duration(seconds: 1),
              child: FlutterLogo(size: pageController.size),
            ),
          ),
        ),

        Expanded(
          child: Container(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(bottom: 60),
          child: DragTarget<int>(
              onMove: (details){
                HapticFeedback.vibrate();                           
              },
              builder: (BuildContext context,
              List<int?> accepted,
              List<dynamic> rejected) {
                return Observer(
                  builder: (context) {
                    return AnimatedSize(
                      curve: Curves.easeInOut,
                      duration: const Duration(seconds: 1),
                      child: ShakeWidget(                       
                        autoPlay: true,
                        shakeConstant: ShakeRotateConstant1(),
                        child: Icon(Icons.delete_forever_rounded,
                        color:const Color.fromARGB(255, 255, 27, 11),
                        size: pageController.size,),
                      ),
                    );
                  }
                );
              },
              onAccept: (int playerID)  {                       
                pageController.updateSize();
                store.deletePlayer(playerID);
              },
            ),
          ),
        )
      ],
    ),
    );
  }
}
