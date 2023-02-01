import 'package:flutter/material.dart';
import 'package:videos_players/screens/videoPage.dart';
import 'globals.dart';

class Video_list extends StatefulWidget {
  const Video_list({Key? key, this.videoLink}) : super(key: key);

  final videoLink;
  @override
  State<Video_list> createState() => _Video_listState();
}

class _Video_listState extends State<Video_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video List"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...videos
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.all(20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Display(videoLink: e['url']),
                          ),
                        );
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: NetworkImage("${e['image']}"),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
