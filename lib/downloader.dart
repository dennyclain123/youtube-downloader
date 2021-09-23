import 'package:flutter_youtube_downloader/flutter_youtube_downloader.dart';

class Download {
  Future<void> downloadVideo(String youtubeLink, String title) async {
    final result = await FlutterYoutubeDownloader.downloadVideo(
        "$youtubeLink", "$title", 18);
    print(result);
  }
}