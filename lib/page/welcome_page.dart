import 'package:flutter/material.dart';
import 'package:myFlutterApp/utils/navigator_utils.dart';
class WelcomePage extends StatefulWidget{
  static final String sName = "/";
  @override
  _WelcomePageState createState()=>_WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>{
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    new Future.delayed(const Duration(seconds: 2,milliseconds: 500),(){
      NavigatorUtils.goHome(context);
//      NavigatorUtils.goLogin(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new Center(
        child: new Image(
          image: AssetImage("images/lake.jpg"),
        ),
      ),
    );
  }
}