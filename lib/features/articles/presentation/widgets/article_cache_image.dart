import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:space_flight/features/articles/presentation/widgets/loading_widget.dart';

class ArticleCacheImage extends StatelessWidget {
  final String? imageUrl;
  final double? width, height;
  const ArticleCacheImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
  });

  Widget _imageWidget(ImageProvider imageProvider) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: imageUrl ?? "lib/assets/no_image.png",
      imageBuilder: (context, imageProvider) {
        return _imageWidget(imageProvider);
      },
      placeholder: (context, url) {
        return const LoadingWidget();
      },
      errorWidget: (context, url, error) {
        return _imageWidget(
          const AssetImage('lib/assets/no_image.png'),
        );
      },
    );
  }
}
