import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;

import '../models/media_item.dart';
import '../utils/media_extensions.dart';

final mediaProvider = StateNotifierProvider<MediaNotifier, List<MediaItem>>(
  (ref) => MediaNotifier(),
);

class MediaNotifier extends StateNotifier<List<MediaItem>> {
  MediaNotifier() : super([]);

  Future<void> pickFolder() async {
    final folderPath = await FilePicker.platform.getDirectoryPath();
    if (folderPath == null) return;

    final root = Directory(folderPath);

    final files = root
        .listSync(recursive: true, followLinks: false)
        .whereType<File>()
        .where(_isMediaFile)
        .map((file) => MediaItem(file.path))
        .toList();

    state = files;
  }

  bool _isMediaFile(File file) {
    final ext = p.extension(file.path).toLowerCase();
    return mediaExtensions.contains(ext);
  }
}
