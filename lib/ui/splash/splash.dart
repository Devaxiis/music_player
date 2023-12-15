import 'package:flutter/material.dart';
import 'package:music_player/ui/audio_player_page/audio_player_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  void toNextPage()async{
    Future.delayed(const Duration(seconds: 2)).then((value) {
      return Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>  AudioPlayerPage()));
    });
  }

  @override
  void initState() {
    super.initState();
    toNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        color: Colors.blue,
        alignment: Alignment.center,
        child: const Text("Audio Player",style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),),
      ),
    );
  }
}
