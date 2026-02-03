import 'package:fluent_ui/fluent_ui.dart';

import 'hero_carousel.dart';
import 'media_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      pane: NavigationPane(
        displayMode: PaneDisplayMode.open,
        items: [
          PaneItem(
            icon: const Icon(FluentIcons.home),
            title: const Text("Home"),
            body: _HomeContent(),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.video),
            title: const Text("Movies"),
            body: _HomeContent(),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.t_v_monitor),
            title: const Text("TV Shows"),
            body: _HomeContent(),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.play),
            title: const Text("Anime"),
            body: _HomeContent(),
          ),
        ],
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: const [
          HeroCarousel(),
          SizedBox(height: 24),
          MediaSection(title: "Continue watching"),
          SizedBox(height: 24),
          MediaSection(title: "Recently added"),
        ],
      ),
    );
  }
}
