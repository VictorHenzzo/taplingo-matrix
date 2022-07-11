import 'package:flutter/material.dart';
import 'package:taplingo_matrix/core/domain/songs.dart';

class SongFrame extends StatelessWidget {
  const SongFrame({
    required this.song,
    required this.callBack,
    Key? key,
  }) : super(key: key);

  final Song song;
  final Function() callBack;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callBack,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(song.cover!, width: 100, loadingBuilder:
                  (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                    child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ));
              }),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.track!,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${song.album!} • ${song.artist!}',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_circle_right_outlined)
          ],
        ),
      ),
    );
  }
}
