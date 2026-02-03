import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit/media_kit.dart';
import 'package:window_manager/window_manager.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  MediaKit.ensureInitialized(); // 🔑 REQUIRED

  await windowManager.ensureInitialized();
  await windowManager.setMinimumSize(const Size(900, 600));

  runApp(const ProviderScope(child: PlayerApp()));
}
