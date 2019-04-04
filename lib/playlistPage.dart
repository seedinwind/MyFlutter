import 'package:flutter/material.dart';

class PlaylistPage extends StatefulWidget {
  PlaylistPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PlaylistPageState();
  }
}

class _PlaylistPageState extends State<PlaylistPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.separated(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(title:Text("listItem") ,);
      },
      separatorBuilder: (context, index) => Divider(
            color: Colors.cyanAccent,
            height: 10,
          ),
    ));
  }
}
