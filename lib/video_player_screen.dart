import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';

class FullScreenVideoWithButton extends StatefulWidget {
  final String videoUrl;

  FullScreenVideoWithButton({required this.videoUrl});

  @override
  _FullScreenVideoWithButtonState createState() =>
      _FullScreenVideoWithButtonState();
}

class _FullScreenVideoWithButtonState extends State<FullScreenVideoWithButton> {
  late VideoPlayerController _controller;
  bool _isPlaying = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _takePicture() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);
    // Do something with the taken picture
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            _isPlaying = !_isPlaying;
            if (_isPlaying) {
              _controller.play();
            } else {
              _controller.pause();
            }
          });
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              // top: 0,
              // left: 0,
              child: Center(
                child: FloatingActionButton(
                  onPressed: _takePicture,
                  child: Icon(Icons.camera_alt),
                ),
              ),
            ),
            _controller.value.isInitialized && !_controller.value.isPlaying
                ? Icon(
                    Icons.play_arrow,
                    size: 80.0,
                    color: Colors.white,
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
