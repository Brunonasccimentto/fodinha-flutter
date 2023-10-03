import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fodinha_flutter/components/atoms/circle_color.dart';
import 'package:fodinha_flutter/model/player.dart';

class AvatarPlayerCircle extends StatelessWidget {
  final dynamic data;
  final PlayerModel? secondData;
  final double? width;
  final double? height;
  final double? opacity;
  final double? radius;
  final VoidCallback? onLongPress;
  final VoidCallback? onTap; 

  const AvatarPlayerCircle(
      {required this.data, this.height, this.width, this.opacity, this.onLongPress, this.onTap, this.radius, Key? key, this.secondData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity ?? 1,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            
            Container(
              child: data.picture.contains(".svg")
                  ? SvgPicture.asset(
                      data.picture,
                      width: width ?? 80,
                      height: height ?? 80,
                    )
                  : data.picture.contains("<")
                  ? SvgPicture.string(
                      data.picture,
                      width: width ?? 80,
                      height: height ?? 80,
                    )
                  : CircleColor(
                    data: data.runtimeType == PlayerModel ? data : secondData,
                    width: width,
                    height: height,
                    radius: 90,))
          ],
        ),
      ),
    );
  }
}
