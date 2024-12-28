import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_grocery/const.dart';
import 'package:shimmer/shimmer.dart';

class BannerCard extends StatelessWidget {
  final String imageUrl;
  const BannerCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    String fullImageUrl = '$baseUrl$imageUrl'; // Combine baseUrl and imageUrl
    print('Image URL: $fullImageUrl'); // Print the combined URL
    return Container(
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        // child: CachedNetworkImage(
        //   imageUrl: fullImageUrl,
        //   progressIndicatorBuilder: (context, url, downloadProgress) =>
        //       Shimmer.fromColors(
        //     highlightColor: Colors.white,
        //     baseColor: Colors.grey.shade300,
        //     child: Container(
        //       margin: const EdgeInsets.all(10),
        //       decoration: const BoxDecoration(
        //         color: Colors.grey,
        //         borderRadius: BorderRadius.all(Radius.circular(10)),
        //       ),
        //       child: ClipRRect(
        //         borderRadius: const BorderRadius.all(Radius.circular(10)),
        //         child: AspectRatio(
        //           aspectRatio: 16 / 9,
        //           child: Container(
        //             color: Colors.grey,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        //   fit: BoxFit.cover,
        //   width: double.infinity,
        // ),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            print('Download progress: $loadingProgress');
            return Shimmer.fromColors(
              highlightColor: Colors.white,
              baseColor: Colors.grey.shade300,
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
