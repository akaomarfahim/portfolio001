import 'package:flutter/material.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__loadings.dart';

myNetworkImage({
  required String imageurl,
  BoxFit fit = BoxFit.cover,
  double radius = 0,
  double? height = 200,
  double? width,
  EdgeInsets? margin,
  EdgeInsets? padding,
  FilterQuality filter = FilterQuality.high,
  bool showloading = true,
  bool showloadingValue = true,
}) =>
    Container(
        height: height,
        width: width,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius)),
        clipBehavior: Clip.hardEdge,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: InteractiveViewer(
                clipBehavior: Clip.antiAlias,
                panEnabled: true,
                scaleEnabled: true,
                child: Image(
                    image: NetworkImage(imageurl),
                    fit: fit,
                    alignment: Alignment.center,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, color: Colors.red),
                    frameBuilder: (context, child, frame, wasSynchronouslyLoaded) => (wasSynchronouslyLoaded)
                        ? child
                        : AnimatedOpacity(opacity: frame == null ? 0 : 1, duration: const Duration(seconds: 1), curve: Curves.easeOut, child: child),
                    loadingBuilder: !showloading
                        ? null
                        : (context, child, loadingProgress) => (loadingProgress == null)
                            ? child
                            : myCircularLoader(
                                showPercentage: showloadingValue ? true : false,
                                bakcground: Colors.transparent,
                                color: Colors.black54,
                                value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null)))));
