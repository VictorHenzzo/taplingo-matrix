import 'package:flutter/material.dart';
import 'package:taplingo_matrix/core/domain/lyrics.dart';
import 'package:taplingo_matrix/core/ports/input/fetch_lyrics_input_port.dart';

class LyricsScreen extends StatelessWidget {
  const LyricsScreen({
    required this.fetchLyricsInputPort,
    required this.apiLyrics,
    Key? key,
  }) : super(key: key);

  final FetchLyricsInputPort fetchLyricsInputPort;
  final String apiLyrics;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Letra'),
      ),
      body: _buildLyrics(),
    );
  }

  Widget _buildLyrics() {
    return StreamBuilder<Lyrics>(
      stream: fetchLyricsInputPort.fetchLyrics(apiLyrics),
      builder: (context, snapshot) {
        final lyric = snapshot.data;

        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Ops!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                Text(
                  'Esta música ainda não tem uma letra salva :/',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          );
        }

        if (lyric == null) {
          return _loading();
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  lyric.track!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                Text(
                  lyric.artist!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 15),
                Text(lyric.lyrics!),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
