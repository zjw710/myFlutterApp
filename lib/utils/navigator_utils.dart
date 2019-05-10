import 'package:flutter/material.dart';
import 'package:myFlutterApp/page/home_page.dart';
import 'package:myFlutterApp/page/login_page.dart';

class NavigatorUtils{
  //跳转首页
  static goHome(BuildContext context){
    Navigator.pushReplacementNamed(context, HomePage.sName);
  }
  //跳转登录页
  static goLogin(BuildContext context){
    Navigator.pushReplacementNamed(context, LoginPage.sName);
  }
}