import 'package:flutter/material.dart';
import 'homeData.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:toast/toast.dart';

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
        widthFactor: 1.1,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(child: PlaylistBanner()),
            SliverPadding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return _buildHotItem(context, index);
                  }, childCount: 4),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 1.33),
                )),
            SliverPadding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return _buildSectionItem(context, index);
                  }, childCount: 20),
                )),
            SliverPadding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return _buildElegantItem(context, index);
                  }, childCount: 100),
                )),
          ],
        ));
  }

  Widget _buildHotItem(context, index) {
//    return Container(
//      decoration: BoxDecoration(
//          image: DecorationImage(fit: BoxFit.fitHeight,image: CachedNetworkImageProvider(url))),
//      child: Align(
//        alignment: Alignment.bottomLeft,
//        child: Text("demo"),
//      ),
//    );

    return GestureDetector(
        onTap: ()=>dealClickHot(context,index),
    child:Stack(
      children: <Widget>[
        AspectRatio(
          child:
              Image(fit: BoxFit.fill, image: CachedNetworkImageProvider(url)),
          aspectRatio: 1.33,
        ),
        Positioned(
//          left: 10,
          top: 10,
          right: 10,
          child: Text(
            "20",
            maxLines: 2,
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.white),
          ),
        ),
        Positioned(
          left: 10,
          bottom: 20,
          right: 10,
          child: Text(
            "demoXXXXXXXXXXXXXXXXXXXX",
            maxLines: 2,
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    ));
  }

  Widget _buildSectionItem(context, index) {
    return GestureDetector(
        onTap: ()=>dealClickSection(context,index),
        child: Container(
            child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Stack(
                  children: <Widget>[
                    Image(
                      fit: BoxFit.fill,
                      colorBlendMode: BlendMode.modulate,
                      color: Colors.greenAccent,
                      image: CachedNetworkImageProvider(url),
                    )
                  ],
                ))));
  }

  Widget _buildElegantItem(context, index) {
    return GestureDetector(
        onTap: (){ dealClickElegant(context,index);},
        child: Container(
            child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Image(image: CachedNetworkImageProvider(url)))));
  }

 dealClickElegant(BuildContext context,int index) {
    Toast.show(index.toString(),context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
  }
  dealClickSection(context,index) {}
  dealClickHot(context,index) {}

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
