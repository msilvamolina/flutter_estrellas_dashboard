import 'package:estrellas_dashboard/app/components/table/table_row_text.dart';
import 'package:estrellas_dashboard/app/components/utils/row_or_column.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

import '../../utils/responsive.dart';

/// Stateful widget to fetch and then display video content.
class VideoWidget extends StatefulWidget {
  const VideoWidget({super.key, required this.videoUrl});

  final String videoUrl;

  @override
  // ignore: library_private_types_in_public_api
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoWidget> {
  late VideoPlayerController _controller;
  bool _isPlaying = true;

  bool _iconAnimationShowing = false;
  IconData _iconAnimationIcon = Icons.pause;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {
          _controller.setLooping(true);
          _controller.pause();
        });
      });

    _controller.setVolume(100);
  }

  void onPause() {
    setState(() {
      _isPlaying = !_controller.value.isPlaying;
      _isPlaying ? _controller.play() : _controller.pause();
      _iconAnimationIcon = _isPlaying ? Icons.play_arrow : Icons.pause;

      _iconAnimationShowing = true;
    });

    Future.delayed(Duration(milliseconds: 700), () {
      setState(() {
        _iconAnimationShowing = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    bool showButtonsOutside = screenWidth < 840;

    return !Responsive.isMobile(context)
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 320,
                width: 180,
                child: videoContent(showButtonsOutside),
              ),
              const SizedBox(width: 8),
              Expanded(child: TableRowText(text: widget.videoUrl)),
            ],
          )
        : Column(
            children: [
              TableRowText(text: widget.videoUrl),
              const SizedBox(height: 8),
              AspectRatio(
                aspectRatio: 9 / 16,
                child: videoContent(showButtonsOutside),
              ),
            ],
          );
  }

  Widget videoContent(showButtonsOutside) => GestureDetector(
        onTap: onPause,
        child: Stack(
          children: [
            VideoPlayer(_controller),
            Center(
              child: AnimatedOpacity(
                opacity: _iconAnimationShowing ? 0.4 : 0,
                duration: Duration(milliseconds: 500),
                child: Icon(
                  _iconAnimationIcon,
                  size: 140,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
