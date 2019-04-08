import 'package:flutter/material.dart';
import 'homeData.dart';
import 'package:cached_network_image/cached_network_image.dart';

const url = "http://img2.2345.com/duoteimg/softImg/ztimg/1/1522054339_88.jpg";

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
        SliverToBoxAdapter(child: PlaylistBanner()),
        SliverGrid(
          delegate: SliverChildBuilderDelegate((context, index) {
            return _buildHotItem(context, index);
          }, childCount: 4),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return _buildSectionItem(context, index);
          }, childCount: 20),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return _buildElegantItem(context, index);
          }, childCount: 100),
        ),
      ],
    ));
  }

  Widget _buildHotItem(context, index) {
    return Container(
        child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.bottomLeft,
          child: Image(image: CachedNetworkImageProvider(url)),
        ),
        Positioned(
          left: 10,
          bottom: 20,
          child: Text("demo"),
        )
      ],
    ));
  }

  Widget _buildSectionItem(context, index) {
    return Container(child: Image(image: CachedNetworkImageProvider(url)));
  }

  Widget _buildElegantItem(context, index) {
    return Container(child: Image(image: CachedNetworkImageProvider(url)));
  }
}

class PlaylistBanner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PlaylistBannerState();
  }
}

class _PlaylistBannerState extends State<PlaylistBanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(children: [
        Center(
          child: ItemBanner(),
        ),
        Center(
          child: ItemBanner(),
        )
      ]),
      constraints: BoxConstraints.expand(height: 250),
    );
  }
}

class ItemBanner extends StatelessWidget {
  ItemBanner({@required PlaylistEntity data}) {
    this.data = data;
  }

  PlaylistEntity data;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: <Widget>[
        Image(image: CachedNetworkImageProvider(url)),
      ],
    ));
  }
}
