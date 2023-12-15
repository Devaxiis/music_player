import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/data/model/music_model.dart';

class AudioPlayerPage extends StatefulWidget {
  AudioPlayerPage({super.key});

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  List<MusicModel> music = [
    MusicModel(
        nameMusic: "Ozbekistonlik",
        author: 'Konsta',
        cover:
            'https://images.genius.com/838d5e9cbfd7668140e99efac266d6c5.1000x1000x1.jpg',
        path: '2.mp3'),
    MusicModel(
        nameMusic: "Gulim",
        author: 'Konsta',
        cover: 'https://i.ytimg.com/vi/1zkcbMSv3IM/maxresdefault.jpg',
        path: 'assets/1.mp3'),
  ];

  int currentMusic = 0;
  bool isPlaying = false;
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.all(20),
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 200,
                width: 200,
                margin: const EdgeInsets.only(top: 100, bottom: 20),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(music[currentMusic].cover)),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white.withOpacity(0.4),
                          blurRadius: 2,
                          spreadRadius: 2)
                    ]),
              ),
            ),
            Text(
              "${music[currentMusic].nameMusic} \n${music[currentMusic].author}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
           
            StreamBuilder(
              stream: player.onDurationChanged,
               builder: (context,snapshot){
                return  ProgressBar(
              progress: const Duration(seconds: 0),
              total: snapshot.data??const Duration(minutes: 3),
              onSeek: (duration) {
                player.seek(duration);
                setState(() {});
              },
            );
               }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                       player.stop();
                      player.play(AssetSource(music[currentMusic++].path));
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {
                      player.state == PlayerState.playing
                          ? player.pause()
                          : player.play(AssetSource(music[currentMusic].path));
                      
                    },
                    icon: Icon(player.state == PlayerState.playing ? Icons.pause: Icons.play_arrow,)
                        ),
                IconButton(
                    onPressed: () {
                      player.stop();
                      player.play(AssetSource(music[currentMusic++].path));
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
