import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:voco_case/app/utilities/extensions/size_extensions.dart';

class VocoImage extends StatelessWidget {
  const VocoImage(
      {super.key,
      this.fit = BoxFit.cover,
      required this.imageUrl,
      this.placeholder,
      this.errorWidget,
      this.width,
      this.height,
      this.shape = BoxShape.circle,
      this.imageBuilder});
  final BoxFit fit;
  final String imageUrl;
  final Widget Function(BuildContext, String)? placeholder;
  final Widget Function(BuildContext, String, dynamic)? errorWidget;
  final double? width;
  final double? height;
  final BoxShape shape;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      imageUrl: imageUrl,
      placeholder: placeholder ??
          (context, url) => const CircularProgressIndicator.adaptive(),
      errorWidget: errorWidget ?? (context, url, error) => const FlutterLogo(),
      imageBuilder: imageBuilder ??
          (context, imageProvider) => Container(
                width: width ?? context.screenWidht(0.15),
                height: height ?? context.screenHeight(0.12),
                decoration: BoxDecoration(
                  shape: shape,
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
    );
  }
}
