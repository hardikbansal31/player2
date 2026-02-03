import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:media_kit/media_kit.dart';
import 'package:path/path.dart' as p;

import '../../providers/player_provider.dart';

class PlayerPage extends ConsumerStatefulWidget {
  final String path;

  const PlayerPage({super.key, required this.path});

  @override
  ConsumerState<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends ConsumerState<PlayerPage> {
  late final Player player;

  @override
  void initState() {
    super.initState();
    // Read player in initState - ref is available in ConsumerStatefulWidget
    player = ref.read(playerProvider);
    // Open media after the first frame to ensure widget tree is ready
    WidgetsBinding.instance.addPostFrameCallback((_) {
      player.open(Media(widget.path));
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: PageHeader(title: Text(p.basename(widget.path))),
      content: Center(child: Video(controller: VideoController(player))),
    );
  }
}
