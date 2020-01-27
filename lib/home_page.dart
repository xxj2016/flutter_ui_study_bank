import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_ui_study_bank/bottom_widget.dart';
import 'package:flutter_ui_study_bank/center_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey _key1 = GlobalKey();
  GlobalKey _key2 = GlobalKey();
  GlobalKey _key3 = GlobalKey();

  double _height1 = 0;
  double _height2 = 0;
  double _height3 = 0;

  double each_padding = 50;

  double max_left = 100;

  double yOffset = 0;
  double max_offset = 1;

  ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          yOffset = _scrollController.offset;
        });
      });
    SchedulerBinding.instance.endOfFrame.then((v) {
      _height1 = _findHeightByKey(_key1);
      _height2 = _findHeightByKey(_key2);
      _height3 = _findHeightByKey(_key3);

      max_offset = _height1 +
          _height2 +
          _height3 -
          each_padding * 2 -
          MediaQuery.of(context).size.height;

      if (max_offset <= 0) {
        max_offset = 0;
      }

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      body: Container(
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              controller: _scrollController,
              child: SizedBox(
                height: _height1 == 0
                    ? 0
                    : (_height1 + _height2 + _height3 - each_padding * 2),
                child: Stack(
                  children: _buildStack(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildStack() {
    List<Widget> _list = [];

    _list.add(Positioned(
      top: _height1 + _height2 - each_padding * 2,
      left: max_left / 2 - max_left / 2 * (1.0 * yOffset / max_offset),
      child: BottomWidget(_key3),
    ));

    _list.add(Positioned(
      top: _height1 - each_padding,
      left: max_left * (1.0 * yOffset / max_offset),
      child: CenterWidget(_key2),
    ));
  }

  double _findHeightByKey(GlobalKey<State<StatefulWidget>> key) {
    RenderBox renderBox = key.currentContext.findRenderObject();

    return renderBox.size.height;
  }
}
