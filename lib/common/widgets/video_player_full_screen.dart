import 'package:flutter/material.dart';
import 'package:kid_need_pishrun_event_02/common/widgets/loading_widget.dart';
import 'package:kid_need_pishrun_event_02/common/widgets/our_text.dart';
import 'package:kid_need_pishrun_event_02/common/widgets/responsive.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerFullScreen extends StatefulWidget {
  final String videoUrl;
  final String thumbnailUrl;
  final String title;
  final Duration startPoint;
  final Function getController;

  VideoPlayerFullScreen({
    Key key,
    @required this.videoUrl,
    this.getController,
    this.startPoint = Duration.zero,
    this.title = "",
    this.thumbnailUrl = "",
  }) : super(key: key);

  @override
  _VideoPlayer createState() => _VideoPlayer();
}

class _VideoPlayer extends State<VideoPlayerFullScreen> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    initialPlayer(widget.videoUrl);
  }

  Future<void> initialPlayer(String video) async {
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _controller
            ..setLooping(false)
            ..seekTo(widget.startPoint)
            ..play();
          if (widget.getController != null) widget.getController(_controller);
        });
      });
    while (true) {
      await Future.delayed(const Duration(seconds: 1), () => "1");
      setState(() {});
    }
  }

  bool _isVisiblePlayButton = false;
  bool _isVisibleForwardButton = false;
  bool _isVisibleBackWardButton = false;

  int _numberOfLastTouch = 0;

  void showController() async {
    setState(() => _isVisiblePlayButton = true);
    _numberOfLastTouch++;
    int numberOfCurrentTouch = _numberOfLastTouch;
    Future.delayed(
        const Duration(seconds: 2),
        () => setState(() {
              if (numberOfCurrentTouch == _numberOfLastTouch) _isVisiblePlayButton = false;
            }));
  }

  void showForwardAndBackwardButton(bool isForward) async {
    _isVisiblePlayButton = false;
    _isVisibleForwardButton = isForward;
    _isVisibleBackWardButton = !isForward;
    setState(() {});
    Future.delayed(
        const Duration(milliseconds: 400),
        () => setState(() {
              _isVisiblePlayButton = false;
              _isVisibleForwardButton = false;
              _isVisibleBackWardButton = false;
            }));
  }

  bool isLandscapeNotifier = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: isLandscapeNotifier
            ? SizedBox(width: double.infinity, height: double.infinity, child: videoWidgetWithUpButtons(isLandscapeNotifier))
            : videoWidgetWithUpButtons(isLandscapeNotifier));
  }

  Widget videoWidgetWithUpButtons(bool isLandscape) {
    return RotatedBox(
      quarterTurns: isLandscape ? 1 : 0,
      child: Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AbsorbPointer(
                    child: _controller != null && _controller.value.isInitialized
                        ? isLandscape
                            ? SizedBox(
                                height: Responsive.width(context) - 15.0,
                                child: AspectRatio(aspectRatio: _controller.value.aspectRatio, child: VideoPlayer(_controller)))
                            : AspectRatio(aspectRatio: _controller.value.aspectRatio, child: VideoPlayer(_controller))
                        : Container(),
                  ),
                  _videoProgressBarWidget(),
                ],
              )),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: SizedBox(
                height: isLandscape ? double.infinity : Responsive.width(context) * (1 / _controller.value.aspectRatio),
                width: isLandscape ? Responsive.width(context) * (_controller.value.aspectRatio) : double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                        bottom: 5,
                        right: 20,
                        child: FutureBuilder<Duration>(
                            future: _controller.position,
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) return Container();
                              Duration remain = _controller.value.duration - snapshot.data;
                              return OurText("${remain.inMinutes.toString().padLeft(2, "0")}:${(remain.inSeconds % 60).toString().padLeft(2, "0")}",
                                  color: Colors.white, fontSize: 23);
                            })),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                            child: GestureDetector(
                                onTap: () => showController(),
                                onDoubleTap: () async {
                                  showForwardAndBackwardButton(true);
                                  Duration duration = await _controller.position;
                                  return _controller.seekTo(Duration(seconds: duration.inSeconds + 5));
                                },
                                child: Container(decoration: BoxDecoration(color: Colors.green.withOpacity(0.0))))),
                        Expanded(
                            child: GestureDetector(
                                onTap: () => showController(),
                                onDoubleTap: () async {
                                  showForwardAndBackwardButton(false);
                                  Duration duration = await _controller.position;
                                  return _controller.seekTo(Duration(seconds: duration.inSeconds - 5));
                                },
                                child: Container(decoration: BoxDecoration(color: Colors.red.withOpacity(0.0))))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          _loadingWidget(),
          pauseAndResumeWidget(),
          forwardAndBackWardWidget(),
          Align(
              alignment: Alignment.topRight,
              child: Row(
                children: [
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.close, color: Colors.grey, size: 45.0),
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                  isLandscape
                      ? GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.fullscreen_exit, color: Colors.grey, size: 45.0),
                          ),
                          onTap: () => setState(() => isLandscapeNotifier = false),
                        )
                      : GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.fullscreen, color: Colors.grey, size: 45.0),
                          ),
                          onTap: () => setState(() => isLandscapeNotifier = true),
                        ),
                ],
              )),
        ],
      ),
    );
  }

  SizedBox _videoProgressBarWidget() {
    return SizedBox(
      height: 15,
      child: _controller == null || !_controller.value.isInitialized
          ? Container()
          : Directionality(
              textDirection: TextDirection.ltr, child: VideoProgressIndicator(_controller, allowScrubbing: true, padding: EdgeInsets.zero)),
    );
  }

  Align pauseAndResumeWidget() {
    return Align(
      alignment: Alignment.center,
      child: Visibility(
        visible: _isVisiblePlayButton,
        child: Opacity(
          opacity: 0.4,
          child: GestureDetector(
            onTap: () {
              showController();
              setState(() {
                _controller.value.isPlaying ? _controller.pause() : _controller.play();
              });
            },
            child: Container(
              height: 100,
              width: 100,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: _controller == null
                    ? Container()
                    : Icon(
                        _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                        size: 70,
                        color: Color(0xff6c6c6c),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Align forwardAndBackWardWidget() {
    return Align(
      alignment: Alignment.center,
      child: Visibility(
        visible: _isVisibleBackWardButton || _isVisibleForwardButton,
        child: Opacity(
          opacity: 0.4,
          child: Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 5.0),
                  Icon(
                    _isVisibleForwardButton ? Icons.fast_forward_rounded : Icons.fast_rewind_rounded,
                    size: 70,
                    color: Color(0xff6c6c6c),
                  ),
                  OurText(
                    "5 ثانیه",
                    fontSize: 12,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _loadingWidget() {
    return Align(
      alignment: Alignment.center,
      child: Visibility(visible: !_controller.value.isInitialized || _controller.value.isBuffering, child: LoadingWidget()),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }
}
