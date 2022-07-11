import 'package:flutter/material.dart';
import 'package:taplingo_matrix/core/domain/songs.dart';
import 'package:taplingo_matrix/core/ports/input/fetch_song_list_input_port.dart';
import 'package:taplingo_matrix/modules/lyrics/navigation/directions/song_list_result_screen_directions.dart';
import 'package:taplingo_matrix/modules/lyrics/ui/components/song_frame.dart';

class SongListResultScreen extends StatelessWidget {
  const SongListResultScreen({
    Key? key,
    required this.fetchSoundListInputPort,
    required this.searchSong,
  }) : super(key: key);

  final FetchSongListInputPort fetchSoundListInputPort;
  final String searchSong;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultados para: $searchSong'),
      ),
      body: _buildSongList(),
    );
  }

  Widget _buildSongList() {
    return StreamBuilder<SongList>(
      stream: fetchSoundListInputPort.fetchSongList(searchSong),
      builder: (context, snapshot) {
        final songList = snapshot.data;

        if (songList == null) {
          return _loading();
        }

        if (songList.length == 0) {
          return const Center(
            child: Text(
              "Ops!!! Nenhum resultado encontrado",
              style: TextStyle(fontSize: 20),
            ),
          );
        }

        return ListView.builder(
            physics: const ScrollPhysics(),
            itemCount: songList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                title: SongFrame(
                  song: songList.list[index],
                  callBack: () {
                    _redirectToLyrics(songList.list[index].apiLyrics!);
                  },
                ),
              );
            });
      },
    );
  }

  Widget _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  void _redirectToLyrics(String apiLyrics) {
    SongListResultScreenDirections(this).goToLyrics(apiLyrics);
  }
}
