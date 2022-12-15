import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../Basepackage/baseclass.dart';

class ProductDetailMedia extends StatelessWidget with baseclass {
  const ProductDetailMedia(
      {Key? key,
      required this.url,
      required this.mediaType,})
      : super(key: key);

  final String url;
  final String mediaType;

  @override
  Widget build(BuildContext context) {

      return CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.fill,
      );}
}
