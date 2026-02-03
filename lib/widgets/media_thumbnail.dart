import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;

import '../features/player/player_page.dart';
import '../models/media_item.dart';

class MediaThumbnail extends ConsumerWidget {
  final MediaItem item;

  const MediaThumbnail({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        Navigator.of(
          context,
        ).push(FluentPageRoute(builder: (_) => PlayerPage(path: item.path)));
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black.withOpacity(0.35),
        ),
        child: Center(
          child: Text(
            p.basename(item.path),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
