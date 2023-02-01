import 'package:flutter/material.dart';
import 'package:videos_players/screens/video_list.dart';

void main() {
  runApp(
   HomePage(),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>const Video_list(),
        //'video_page':(context)=> Display(videoLink: e[]),
      },
    );
  }
}

