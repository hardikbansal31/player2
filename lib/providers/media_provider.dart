import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/media_item.dart';

final mediaProvider = StateNotifierProvider<MediaNotifier, List<MediaItem>>(
  (ref) => MediaNotifier(),
);

class MediaNotifier extends StateNotifier<List<MediaItem>> {
  MediaNotifier() : super([]);

  Future<void> pickFolder() async {
    final result = await FilePicker.platform.getDirectoryPath();
    if (result == null) return;

    final dir = Directory(result);
    final files = dir.listSync();

    state = files
        .whereType<File>()
        .map((file) => MediaItem(file.path))
        .toList();
  }
}
