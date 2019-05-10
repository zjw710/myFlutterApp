import 'package:flutter/material.dart';
void main()=>runApp(new MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: new Text(
                      'Oeschinen Lake Campground',
                      style: new TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  new Text(
                    'Kandersteg, Switzerland',
                    style: new TextStyle(
                      color: Colors.grey[500]
                    ),
                  )
                ],
              )
          ),
          new FavoriteWidget()
//          new Icon(
//            Icons.star,
//            color: Colors.red[500],
//          ),
//          new Text('41')
        ],
      ),
    );
    Column buildButtonColumn(IconData icon,String label){

      Color color = Theme.of(context).primaryColor;
      return new Column(
        crossAxisAlignment:CrossAxisAlignment.center,
        children: <Widget>[
          new Icon(
            icon,
            color: color,
          ),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          )
        ],
      );
    }
    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          buildButtonColumn(Icons.call,"CALL"),
          buildButtonColumn(Icons.near_me,"ROUTE"),
          buildButtonColumn(Icons.share,"SHARE"),
        ],
      ),
    );

    List<Container> _buildGridTileList(int count){
      return new List<Container>.generate(
          count,
          (int index)=>new Container(child: new Image.asset("images/lake.jpg"))
      );
    }
    Widget buildGrid() {
      return new GridView.count(
//          maxCrossAxisExtent: 150.0,
          crossAxisCount: 2,
          padding: const EdgeInsets.all(4.0),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children: _buildGridTileList(30));
    }
    Widget buildCard(){
      return new SizedBox(
        height: 210.0,
        child: new Card(
          child: new Column(
            children: <Widget>[
              new ListTile(
                title: new Text('1625 Main Street', style: new TextStyle(fontWeight: FontWeight.w500)),
                subtitle:new Text('My City, CA 99984'),
                leading: new Icon(
                  Icons.restaurant_menu,
                  color: Colors.blue[500],
                ),
              ),
              new Divider(),
              new ListTile(
                title: new Text('1625 Main Street', style: new TextStyle(fontWeight: FontWeight.w500)),
                leading: new Icon(
                  Icons.restaurant_menu,
                  color: Colors.blue[500],
                ),
              ),
            ],
          ),
        ),
      );
    }
    Widget buildImg(){
      return new Stack(
        alignment: const Alignment(0.2, 0.6),
        children: <Widget>[
          new CircleAvatar(
            backgroundImage: new AssetImage("images/lake.jpg"),
            radius: 100.0,
          ),
          new Container(
            decoration: new BoxDecoration(
              color: Colors.black45
            ),
            child: new Text(
              "hello",
              style: new TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          )
        ],
      );
    }
    return new MaterialApp(
      title: "test",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("myTitle")
        ),
//        body: new Center(
////          child: buildGrid(),
//          child: buildImg(),
//        ),
        body: new ListView(
          children: <Widget>[
            titleSection,
            buttonSection,
            buildImg(),
            buildCard(),
          ],
        ),
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget{
  @override
  _FavoriteWidgetState createState() => new _FavoriteWidgetState();
}
class _FavoriteWidgetState extends State<FavoriteWidget>{
  int _favoriteNum = 32;
  bool _isFavorite = false;

  void _checkFavorite(){
    print("_checkFavorite");
    setState(() {
      if (_isFavorite) {
        _isFavorite = false;
        _favoriteNum -= 1;
      } else {
        _isFavorite = true;
        _favoriteNum += 1;
      }
    });
    print(_favoriteNum);
    print(_isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Row(
      children: <Widget>[
        new IconButton(
            icon: (_isFavorite
                ? new Icon(Icons.star)
                : new Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _checkFavorite
        ),
        new Text('$_favoriteNum')
      ],
    );
  }
}