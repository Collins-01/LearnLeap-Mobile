import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppImage extends StatelessWidget {
  final double height;
  final double width;
  final bool circle;
  final String url;
  final BoxFit? fit;
  final BorderRadiusGeometry? borderRadius;

  const AppImage({
    Key? key,
    this.height = 100,
    this.width = 100,
    this.circle = false,
    this.fit,
    this.borderRadius,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (circle) {
      return ClipOval(
        child: SizedBox(
          height: height,
          width: width,
          child: CachedNetworkImage(
            imageUrl: url,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: fit ?? BoxFit.cover,
            placeholder: (context, url) => Center(
              child: Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(.2),
                highlightColor: Colors.grey.withOpacity(.5),
                child: Container(
                  height: height,
                  width: width,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: borderRadius,
      ),
      child: CachedNetworkImage(
        imageUrl: url,
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: fit ?? BoxFit.cover,
        placeholder: (context, url) => Center(
          child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(.2),
            highlightColor: Colors.grey.withOpacity(.5),
            child: Container(
              height: height,
              width: width,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
