import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';

import '../models/media_item.dart';

class MediaThumbnail extends StatelessWidget {
  final MediaItem item;

  const MediaThumbnail({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black.withOpacity(0.35),
      ),
      child: Center(
        child: Text(
          File(item.path).uri.pathSegments.last,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
