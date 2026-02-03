import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/media_provider.dart';
import '../../widgets/media_thumbnail.dart';

class MediaSection extends ConsumerWidget {
  final String title;

  const MediaSection({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final media = ref.watch(mediaProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(title, style: const TextStyle(fontSize: 18)),
            const Spacer(),
            Button(
              child: const Text("Pick folder"),
              onPressed: () {
                ref.read(mediaProvider.notifier).pickFolder();
              },
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 140,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: media.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return MediaThumbnail(item: media[index]);
            },
          ),
        ),
      ],
    );
  }
}
