import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_samples/components/colors.dart';
import 'package:flutter_samples/components/display_task_info.dart';
import 'package:flutter_samples/models/list_tile_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cached_network_image/cached_network_image.dart';

// cached network image
class ListViewTile extends StatelessWidget {
  const ListViewTile({
    super.key,
    required this.object,
  });
  final ListTileModel object;
  static final customeCacheManager = CacheManager(
    Config(
      'customeCacheKey',
      stalePeriod: const Duration(days: 15),
      maxNrOfCacheObjects: 100,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DisplayTaskInfo(
                imageUrl: object.imageUrl,
                description: object.description,
                title: object.title,
              ),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 400,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FadeInUp(
                  delay: const Duration(milliseconds: 400),
                  duration: const Duration(milliseconds: 500),
                  child: CachedNetworkImage(
                    cacheManager: customeCacheManager,
                    key: UniqueKey(),
                    imageUrl: object.imageUrl,
                    fit: BoxFit.fitWidth,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => const SpinKitPulse(
                      color: AppColors.primaryColor,
                      size: 25,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 600),
              duration: const Duration(milliseconds: 700),
              child: Text(
                object.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 600),
              duration: const Duration(milliseconds: 700),
              child: Text(
                object.title,
                maxLines: 2,
                style: const TextStyle(color: Colors.grey, fontSize: 11),
              ),
            )
          ],
        ),
      ),
    );
  }
}


// Image.network(
//                 object.imageUrl,
//                 height: 350,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),