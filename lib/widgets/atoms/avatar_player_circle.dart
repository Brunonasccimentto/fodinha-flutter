import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fodinha_flutter/widgets/atoms/circle_color.dart';
import 'package:fodinha_flutter/model/player/player.dart';

class AvatarPlayerCircle extends StatelessWidget {
  final dynamic data;
  final PlayerModel? secondData;
  final double? width;
  final double? height;
  final double? opacity;
  final double? radius;
  final EdgeInsets? margin;
  final VoidCallback? onLongPress;
  final VoidCallback? onTap; 
  final ColorFilter? filter;

  const AvatarPlayerCircle(
      {required this.data, this.height, this.width, this.opacity, this.onLongPress, this.onTap, this.radius, this.margin, this.filter, Key? key, this.secondData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Opacity(
      opacity: opacity ?? 1,
      child: Container(
        margin: margin,
        alignment: Alignment.center,
        child: ColorFiltered(
          colorFilter: filter ?? const ColorFilter.mode(Colors.transparent, BlendMode.color),
          child: Container(
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
                : data.picture.contains("/cache") ? 
                  ClipOval(
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(40),                 
                      child: Image.file(File(data.picture),                                                   
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                :
                  CircleColor(
                    data: data.runtimeType == PlayerModel ? data : secondData,
                    width: width,
                    height: height,
                    radius: 90
                  )   
          ),
        ),
      ),
    );
  }
}
