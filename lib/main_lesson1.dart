import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main()=>runApp(new MyApp());
//主窗体默认是无状态的
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
    // TODO: implement build
    return new MaterialApp(
      title: "welcome",
      theme: new ThemeData(
        primaryColor: Colors.blue
      ),
      home: new RandomWords(),//导航标题及body内容直接由RandomWords来进行实现
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text("welcome to flutter"),
//        ),
//        body: new Center(
////          child: new Text(wordPair.asPascalCase),
//            child: new RandomWords(),
//        ),
//      ),
    );
  }
}
//创建有状态的组件
class RandomWords extends StatefulWidget{
  @override
  createState()=> RandomWordsState();
}
//使用State进行状态管理，当调用setState时，会为State对象触发build()方法，从而导致对UI的更新
//因此可实现交互
class RandomWordsState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();
  @override
  Widget build(BuildContext context) {

//    final wordPair = new WordPair.random();
//    // TODO: implement build
//    return new Text(wordPair.asPascalCase);
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Startup Name Generator123'),
          //导航标题上添加行为按钮
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
            new IconButton(icon: new Icon(Icons.ac_unit), onPressed: _pushSaved),
          ],
        ),
        body: _buildSuggestions(),
      );
  }
  void _pushSaved(){
    Navigator.of(context).push(
      //创建路由页
      new MaterialPageRoute(
          builder: (context){
            final tiles = _saved.map((pair){
              //列表中的每一行
                return new ListTile(
                  title: new Text(
                    pair.asPascalCase,
                    style: _biggerFont,
                  ),
                  trailing: new Icon(Icons.remove),
                  onTap: (){
                    setState(() {
                      //此处删除行并不会刷新路由页，还需想办法
                      _saved.remove(pair);
                    });
                  },
                );
            });
            final divided = ListTile.divideTiles(
                //在每个列表行中间添加一条分隔线，divided为最终拿到的布局
                tiles: tiles,
                context: context
            ).toList();
            //返回一个布局脚手架，里面包含了收藏的列表
            return new Scaffold(
              appBar: new AppBar(
                title: new Text('Saved Suggestions'),
              ),
              //直接传入创建好的列表行组
              body: new ListView(children: divided,),
            );
          }
      )
    );
  }

  Widget _buildSuggestions(){
    //创建一个列表视图
    return new ListView.builder(
        itemBuilder: (context,i){
          //奇数行则显示分隔线，分隔线并不是行的属性
          if(i.isOdd) return new Divider();
          //因为i的奇数部分显示为分隔线了，因此此处index一进入就变成了2，4，6，8，10...等
          //因此index为i除以2向上取整(其实此处直接除2也没问题)
          final index = i~/2;
          //此处的索引应该是屏幕加载到的条数，当超过容器中元素大小时，就加10条进去
          if(index >= _suggestions.length){
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }
  Widget _buildRow(WordPair pair){
    //contains Returns true if [value] is in the set.
    final alreadySaved = _saved.contains(pair);
    //表格瓦片，即每一格里装着一个文本
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      //trailing 表示尾部的意思
      trailing: new Icon(
        //根据是否已经收藏显示不同的图标,及不同的颜色
        alreadySaved?Icons.favorite :Icons.favorite_border,
        color: alreadySaved?Colors.red:null
      ),
      //Called when the user taps this list tile.
      //用户点击该行时，该函数会被调用
      onTap: (){
        //调用setState() 会为State对象触发build()方法，从而导致对UI的更新
        setState(() {
          if(alreadySaved){
            _saved.remove(pair);
          }else{
            _saved.add(pair);
          }
        });
      },
    );
  }
}
