import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:provider/provider.dart';
import 'package:ruz/theme_provider_file.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  State<VideoApp> createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  bool value = false;
  bool theme = false;

  late FlickManager _flickManager;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.asset('images/lesson1.mp4'),
    );
  }

  @override
  void dispose() {
    _flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("dark Mode"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 100,
              color: Colors.amber,
              child: Text(
                "C++ video lesson",
              ),
            ),
            Center(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber,
                  ),
                  height: 200,
                  width: double.infinity,
                  child: FlickVideoPlayer(
                    flickManager: _flickManager,
                  )),
            ),
            Container(
              alignment: Alignment.center,
              height: 100,
              color: Colors.blue,
              child: Text(
                "C++ video lesson",
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
              },
              child: const Text("Ligh and Dark Mode"),
            ),
            SizedBox(
              height: 10,
            ),
            Transform.scale(
              scale: 2.0,
              child: Switch(
                value: value,
                onChanged: (onChanged) {
                  setState(() {
                    value = onChanged;
                  });
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme();
                },
                activeColor: Colors.green,
                inactiveThumbColor: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
