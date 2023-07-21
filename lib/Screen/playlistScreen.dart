import 'package:app_music/api/CallApiSpotify.dart';
import 'package:app_music/model/ListSongModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../widget/MiniPlayer.dart';

ValueNotifier<Items?> currentlyPlaying = ValueNotifier(null);

class PlaylistScreen extends StatefulWidget {
  String urlListSong;
  PlaylistScreen({required this.urlListSong, super.key});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  ListSongModel? listSongData;
  Items? selectedSong;

  @override
  void initState() {
    CallApiSpotify.fetchApiListSong(widget.urlListSong).then((data) {
      setState(() {
        listSongData = data;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: (listSongData == null)
                  ? const Align(
                      alignment: Alignment.center,
                      child: SpinKitCircle(
                        color: Colors.green,
                        size: 50,
                      ),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Image.network(
                                '${listSongData?.images?[0].url}',
                                height: 250,
                                width: 250,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 20.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Playlist',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                              Text(
                                '${listSongData?.name}',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 40),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '${listSongData?.owner?.displayName} • ${listSongData?.followers?.total} likes • ${listSongData?.tracks?.items?.length} songs',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Expanded(
                                  child: ListView.builder(
                                itemCount: listSongData?.tracks?.items?.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    onTap: () {
                                      selectedSong =
                                          listSongData!.tracks!.items![index];
                                      setState(() {});
                                    },
                                    title: Text(
                                      '${listSongData?.tracks?.items?[index].track?.album?.name}',
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    ),
                                    subtitle: Text(
                                      '${listSongData?.tracks?.items?[index].track?.artists?[0].name}',
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12,
                                      ),
                                    ),
                                    leading: Image.network(
                                      '${listSongData?.tracks?.items?[index].track?.album?.images?[0].url}',
                                      height: 50,
                                      width: 50,
                                    ),
                                  );
                                },
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
            (selectedSong == null)
                ? Container()
                : PlayMusicScreen(selectedSong: currentlyPlaying)
          ],
        ),
      ),
    );
  }
}
