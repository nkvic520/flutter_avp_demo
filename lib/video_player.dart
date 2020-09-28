import 'package:awsome_video_player/awsome_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerG extends StatefulWidget {
  final String videoUrl;
  final VideoCallback<VideoPlayerValue> onCompleted;
  final String title;
  final VideoCallback<VideoPlayerValue> onpop;
  final int startPosition;
  final VideoCallback<VideoPlayerController> oninit;
  final VideoCallback<VideoPlayerValue> onpause;
  final VideoCallback<bool> onfullscreen;

  VideoPlayerG(
      {Key key,
      this.videoUrl,
      this.onCompleted,
      this.title,
      this.onpop,
      this.startPosition,
      this.oninit,
      this.onpause,
      this.onfullscreen})
      : super(key: key);

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayerG> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AwsomeVideoPlayer(
      widget.videoUrl,
      onpop: widget.onpop,
      playOptions: VideoPlayOptions(
          startPosition: Duration(
              seconds:
                  widget.startPosition == null ? 0 : widget.startPosition)),
      oninit: widget.oninit,
      onpause: widget.onpause,

      /// 自定义视频样式
      videoStyle: VideoStyle(
        /// 自定义视频暂停时视频中部的播放按钮
        playIcon: Icon(
          Icons.play_circle_outline,
          size: 60,
        ),

        /// 暂停时是否显示视频中部播放按钮
        showPlayIcon: false,

        videoLoadingStyle: VideoLoadingStyle(
          /// 重写部分（二选一）
          // 重写Loading的widget
          // customLoadingIcon: CircularProgressIndicator(strokeWidth: 2.0),
          // 重写Loading 下方的Text widget
          // customLoadingText: Text("加载中..."),
          /// 设置部分（二选一）
          // 设置Loading icon 下方的文字
          loadingText: "Loading...",
          // 设置loading icon 下方的文字颜色
          loadingTextFontColor: Colors.white,
          // 设置loading icon 下方的文字大小
          loadingTextFontSize: 20,
        ),

        /// 自定义顶部控制栏
        videoTopBarStyle: VideoTopBarStyle(
          show: true,
          //是否显示
          height: 60,
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          barBackgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
          popIcon: Icon(
            Icons.arrow_back,
            size: 20,
            color: Colors.white,
          ),
          contents: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width - 200,
                child: Text(
                  widget.title,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
          //自定义顶部控制栏中间显示区域
//                                    actions: [
//                                      GestureDetector(
//                                        onTap: () {
//                                          ///1. 可配合自定义拓展元素使用，例如广告
//                                          setState(() {
//                                            showAdvertCover = true;
//                                          });
//
//                                          ///
//                                        },
//                                        child: Icon(
//                                          Icons.more_horiz,
//                                          size: 16,
//                                          color: Colors.white,
//                                        ),
//                                      )
//                                    ],

          //自定义顶部控制栏右侧显示区域
          /// 设置cusotmBar之后，以上属性均无效(除了`show`之外)
          // customBar: Positioned(
          //   top: 0,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     width: double.infinity,
          //     height: 50,
          //     color: Colors.yellow,
          //     child: Text("12312312"),
          //   ),
          // ),
          // customBar: Align(
          //   alignment: Alignment.topLeft,
          //   child: Container(
          //     width: double.infinity,
          //     height: 30,
          //     color: Colors.yellow,
          //     child: GestureDetector(
          //       onTap: () {
          //         print("yes");
          //       },
          //       child: Text("123123132")
          //     )
          //   ),
          // ),
        ),

        /// 自定义底部控制栏
        videoControlBarStyle: VideoControlBarStyle(
          /// 自定义颜色
          // barBackgroundColor: Colors.blue,

          ///添加边距
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),

          ///设置控制拦的高度，默认为30，如果图标设置过大但是高度不够就会出现图标被裁剪的现象
          height: 60,

          /// 自定义进度条样式
          // progressStyle: VideoProgressStyle(
          //     // padding: EdgeInsets.all(0),
          //     padding: EdgeInsets.symmetric(
          //         vertical: 0,
          //         horizontal: 10), //vertical不能设置太大，不然被把进度条压缩肉眼无法识别
          //     playedColor: Colors.red,
          //     bufferedColor: Colors.yellow,
          //     backgroundColor: Colors.green,
          //     dragBarColor: Colors
          //         .white, //进度条为`progress`时有效，如果时`basic-progress`则无效
          //     height: 4,
          //     progressRadius:
          //         2, //进度条为`progress`时有效，如果时`basic-progress`则无效
          //     dragHeight:
          //         5 //进度条为`progress`时有效，如果时`basic-progress`则无效
          //     ),

          /// 更改进度栏的播放按钮
          playIcon: Icon(Icons.play_arrow, color: Colors.white, size: 20),

          /// 更改进度栏的暂停按钮
          pauseIcon: Icon(
            Icons.pause,
            color: Colors.white,
            size: 20,
          ),

          /// 更改进度栏的全屏按钮
          fullscreenIcon: Icon(
            Icons.fullscreen,
            size: 20,
            color: Colors.white,
          ),

          /// 更改进度栏的退出全屏按钮
          fullscreenExitIcon: Icon(
            Icons.fullscreen_exit,
            size: 20,
            color: Colors.red,
          ),

          nextIcon: Icon(
            Icons.skip_next,
            size: 20,
            color: Colors.white,
          ),

          /// 决定控制栏的元素以及排序，示例见上方图3
          itemList: [
            "play",
            "next",
            "position-time",
            //当前播放时间
            "progress",
            //线条形进度条（与‘basic-progress’二选一）
            // "basic-progress",//矩形进度条（与‘progress’二选一）
            "duration-time",
            //视频总时长
            // "time",//格式：当前时间/视频总时长
            "fullscreen", "speed",
            "definition",
          ],
        ),
      ),
      onended: widget.onCompleted,
      onfullscreen: widget.onfullscreen,
    );
  }
}
