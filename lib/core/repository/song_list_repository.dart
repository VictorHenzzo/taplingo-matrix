import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:taplingo_matrix/core/domain/songs.dart';
import 'package:taplingo_matrix/core/ports/output/fetch_song_list_output_port.dart';

//TODO: Incluir no arquivo de secrets
const API_KEY = '3228fbX77KUZomeuFZj1ikfFy3djc4BDNz8fOzb8ZwCcwBhtt2a4y3OS';
const MAX_NUMBER_OF_SONGS = 15;

@singleton
class SongListRepository implements FetchSongListOutputPort {
  @override
  Stream<SongList> fetchSongList(String song) {
    return Stream.fromFuture(Future<SongList>(
      () async {
        SongList list;

        var options = BaseOptions(
          baseUrl: 'https://api.happi.dev/v1/',
          connectTimeout: 50000,
          receiveTimeout: 30000,
        );
        var dio = Dio(options);

        try {
          final response = await dio.get(
            'music',
            queryParameters: {
              'q': song,
              'apikey': API_KEY,
              'limit': MAX_NUMBER_OF_SONGS,
            },
          );

          list = SongList.fromJson(response.data);

          return list;
        } catch (e) {
          throw Exception(e.toString());
        }
      },
    ));
  }
}
