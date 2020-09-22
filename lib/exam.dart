// SizedBox(
//   height: 360,
//   child: new VlcPlayer(
//     aspectRatio: 16 / 9,
//     url:
//         "http://distribution.bbb3d.renderfarming.net/video/mp4/bbb_sunflower_1080p_60fps_normal.mp4",
//     controller: _videoViewController2,
//     placeholder: Container(
//       height: 250.0,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[CircularProgressIndicator()],
//       ),
//     ),
//   ),
// ),
// Text("Seek"),
// Slider(
//   activeColor: Colors.white,
//   value: sliderValue,
//   min: 0.0,
//   max: _videoViewController2.duration == null
//       ? 1.0
//       : _videoViewController2.duration.inSeconds.toDouble(),
//   onChanged: (progress) {
//     setState(() {
//       sliderValue = progress.floor().toDouble();
//     });
//     //convert to Milliseconds since VLC requires MS to set time
//     _videoViewController2.setTime(sliderValue.toInt() * 1000);
//   },
// ),
// FlatButton(
//     child: isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
//     onPressed: () => {playOrPauseVideo()}),
// Text("Volume Level"),
// Slider(
//   min: 0,
//   max: 100,
//   value: volumeValue,
//   onChanged: (value) {
//     setState(() {
//       volumeValue = value;
//     });
//     _videoViewController2.setVolume(volumeValue.toInt());
//   },
// ),
// FlatButton(
//   child: Text("Change URL"),
//   onPressed: () => _videoViewController.setStreamUrl(
//       "http://distribution.bbb3d.renderfarming.net/video/mp4/bbb_sunflower_2160p_60fps_normal.mp4"),
// ),
// FlatButton(
//     child: Text("+speed"),
//     onPressed: () => _videoViewController.setPlaybackSpeed(2.0)),
// FlatButton(
//     child: Text("Normal"),
//     onPressed: () => _videoViewController.setPlaybackSpeed(1)),
// FlatButton(
//     child: Text("-speed"),
//     onPressed: () => _videoViewController.setPlaybackSpeed(0.5)),
// Text("position=" +
//     _videoViewController.position.inSeconds.toString() +
//     ", duration=" +
//     _videoViewController.duration.inSeconds.toString() +
//     ", speed=" +
//     _videoViewController.playbackSpeed.toString()),
// Text("ratio=" + _videoViewController.aspectRatio.toString()),
// Text("size=" +
//     _videoViewController.size.width.toString() +
//     "x" +
//     _videoViewController.size.height.toString()),
// Text("state=" + _videoViewController.playingState.toString()),
// image == null ? Container() : Container(child: Image.memory(image)),
