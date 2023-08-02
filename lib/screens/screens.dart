import 'package:app_music/models/ListSongModel.dart';
import 'package:app_music/screens/Home.dart';
import 'package:app_music/screens/Search.dart';
import 'package:app_music/screens/library.dart';
import 'package:flutter/material.dart';

ValueNotifier<bool> isCurrentPlaying = ValueNotifier(false);
ValueNotifier<int?> positionCurrentPlaying = ValueNotifier(null);
ValueNotifier<List<ItemSongs>> currentPlaylist = ValueNotifier([]);

class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  int currentIndex = 0;
  List<Widget> screens = [
    const Home(),
    const Search(),
    const Library(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          screens[currentIndex],
          // isCurrentPlaying.value == false
          //     ? Container()
          //     : PlayMusicScreen(
          //         positionSong: positionCurrentPlaying.value,
          //         listSong: currentPlaylist.value)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedFontSize: 18,
        showUnselectedLabels: false,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white70,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_library_music_outlined),
            label: 'Library',
          )
        ],
      ),
    );
  }
}
