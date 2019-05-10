import 'package:flutter/material.dart';
import 'package:myFlutterApp/page/welcome_page.dart';
import 'package:myFlutterApp/page/login_page.dart';
import 'package:myFlutterApp/page/home_page.dart';
void main(){
  runApp(new FlutterReduxApp());
}
class FlutterReduxApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      routes: {
        WelcomePage.sName:(context){
          return WelcomePage();
        },
        LoginPage.sName:(context){
          return LoginPage();
        },
        HomePage.sName:(context){
          return HomePage();
        }
      }
    );
  }
}