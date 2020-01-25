import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


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

  double each_padding  = 50;
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
      // _height1 = _findHeightByKey(_key1);
      // _height2 = _findHeightByKey(_key2);
      // _height3 = _findHeightByKey(_key3);

      max_offset = _height1 + _height2 + _height3 - each_padding * 2 - MediaQuery.of(context).size.height;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }

}