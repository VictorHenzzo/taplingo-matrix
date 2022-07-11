import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:taplingo_matrix/core/domain/lyrics.dart';
import 'package:taplingo_matrix/core/ports/output/fetch_lyrics_output_port.dart';

//TODO: Incluir no arquivo de secrets
const APIKEY = '3228fbX77KUZomeuFZj1ikfFy3djc4BDNz8fOzb8ZwCcwBhtt2a4y3OS';

@singleton
class LyricsRepository implements FetchLyricsOutputPort {
  @override
  Stream<Lyrics> fetchLyrics(String apiLyrics) {
    return Stream.fromFuture(Future<Lyrics>(
      () async {
        Lyrics lyrics;

        var options = BaseOptions(
          connectTimeout: 50000,
          receiveTimeout: 30000,
        );
        var dio = Dio(options);

        try {
          final response = await dio.get(
            apiLyrics,
            queryParameters: {
              'apikey': APIKEY,
            },
          );

          lyrics = Lyrics.fromJson(response.data);

          return lyrics;
        } catch (e) {
          return Future.error('Lyric not found');
        }
      },
    ));
  }
}
