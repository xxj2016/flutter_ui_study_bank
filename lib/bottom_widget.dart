import 'package:flutter/material.dart';

class BottomWidget extends StatefulWidget {

  GlobalKey sizeKey;

  BottomWidget(this.sizeKey);

  @override
  _BottomWidgetState createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {

  List<String> names = [
    "Joasd Dad",
    "Cxv",
    "Hgjhj Oad",
    "Mkjn Plk",
    "Ldsad Awq",
    "MMJJIJ Nsad",
    "Zda",
    "MNjhhjgh",
  ];


  @override
  Widget build(BuildContext context) {
    return Card(
      key: widget.sizeKey,
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
          top: 100,
          left: 30,
          right: 30,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _buildList(),
        ),
      ),
    );
  }

  List<Widget> _buildList() {
    List<Widget> _list = [];

    _list.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "MONE ASFSDF",
          style: TextStyle(
            color: Color(0xffcfcfce),
            fontSize: 14,
          ),
        ),
        Text(
          "Search peroldfj",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 14,
          ),
        )
      ],
    ));
    _list.add(
      Padding(
        padding: EdgeInsets.only(top: 20),
      )
    );
    _list.addAll(names.map((s) {
      return Padding(
        padding: const EdgeInsets.only(top: 10,
        left: 10, right: 10),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              child: FlutterLogo(),
            )
          ],
        ),
      );
    }));
  }
}