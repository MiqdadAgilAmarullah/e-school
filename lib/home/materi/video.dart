import 'package:chewie/chewie.dart';
// ignore: implementation_imports
import 'package:chewie/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ChewieDemo extends StatefulWidget {
  final String foto, mapel;
  final String linkVid, guru;
  ChewieDemo({this.linkVid, this.guru, this.foto, this.mapel});

  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState(foto);
  }
}

class _ChewieDemoState extends State<ChewieDemo> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;
  VideoPlayerController _videoPlayerController2;
  ChewieController _chewieController;

  String foto;
  _ChewieDemoState(this.foto);

  @override
  void initState() {
    super.initState();

    _videoPlayerController1 =
        VideoPlayerController.network(' ${widget.linkVid}');
    _videoPlayerController2 =
        VideoPlayerController.network(' ${widget.linkVid}');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: false,

      // Try playing around with some of these other options:

      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: widget.foto,
      theme: ThemeData.light().copyWith(
        platform: _platform ?? Theme.of(context).platform,
      ),
      home: Scaffold(
        body: Container(
          color: Colors.black12,
          height: 535,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    AppBar(
                      leading: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      backgroundColor: Color(0xff1E64B9),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.school,
                            size: 30,
                            color: Colors.white,
                          ),
                          Text(
                            " E-School",
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.transparent,
                            ),
                            onPressed: null)
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 0),
                    color: Colors.white,
                    height: 300,
                    // margin: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Chewie(
                          controller: _chewieController,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "${widget.mapel}",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Divider(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(foto),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 17),
                            child: Text(
                              '${widget.guru}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(),
                            Text('Link di :'),
                            Text(' ${widget.linkVid}'),
                            Divider(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
