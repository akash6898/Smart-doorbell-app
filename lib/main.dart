import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: MyAppScaffold());
  }
}

class MyAppScaffold extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppScaffoldState();
}

class MyAppScaffoldState extends State<MyAppScaffold> {
  Uint8List image;

  VlcPlayerController _videoViewController;
  VlcPlayerController _videoViewController2;
  bool isPlaying = true;
  double sliderValue = 0.0;
  double currentPlayerTime = 0;
  double volumeValue = 100;

  @override
  void initState() {
    _videoViewController = new VlcPlayerController(onInit: () {
      _videoViewController.play();
    });
    _videoViewController.addListener(() {
      setState(() {});
    });

    _videoViewController2 = new VlcPlayerController(onInit: () {
      _videoViewController2.play();
    });
    _videoViewController2.addListener(() {
      setState(() {});
    });

    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      String state = _videoViewController2.playingState.toString();
      if (this.mounted) {
        setState(() {
          if (state == "PlayingState.PLAYING" &&
              sliderValue < _videoViewController2.duration.inSeconds) {
            sliderValue = _videoViewController2.position.inSeconds.toDouble();
          }
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Plugin example app'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: _createCameraImage,
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(
              height: 360,
              child: new VlcPlayer(
                aspectRatio: 16 / 9,
                url: "http://192.168.43.230:5000/video_feed",
                controller: _videoViewController,
                // Play with vlc options
                options: [
                  '--quiet',
                  '--no-drop-late-frames',
                  '--no-skip-frames',
                  '--rtsp-tcp'
                ],
                hwAcc: HwAcc
                    .DISABLED, // or {HwAcc.AUTO, HwAcc.DECODING, HwAcc.FULL}
                placeholder: Container(
                  height: 250.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[CircularProgressIndicator()],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void playOrPauseVideo() {
    String state = _videoViewController2.playingState.toString();

    if (state == "PlayingState.PLAYING") {
      _videoViewController2.pause();
      setState(() {
        isPlaying = false;
      });
    } else {
      _videoViewController2.play();
      setState(() {
        isPlaying = true;
      });
    }
  }

  void _createCameraImage() async {
    Uint8List file = await _videoViewController.takeSnapshot();
    setState(() {
      image = file;
    });
  }
}
