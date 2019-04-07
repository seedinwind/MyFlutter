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
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(),
            SliverGrid(),
            SliverList(),
            SliverList(),
          ],
    ));
  }
}
