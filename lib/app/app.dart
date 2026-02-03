import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';

import '../theme/app_theme.dart';
import '../features/home/home_page.dart';

class PlayerApp extends StatefulWidget {
  const PlayerApp({super.key});

  @override
  State<PlayerApp> createState() => _PlayerAppState();
}

class _PlayerAppState extends State<PlayerApp> {
  @override
  void initState() {
    super.initState();
    _initAcrylic();
  }

  Future<void> _initAcrylic() async {
    await Window.initialize();
    await Window.setEffect(
      effect: WindowEffect.acrylic,
      color: const Color(0xCC000000),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const HomePage(),
    );
  }
}
