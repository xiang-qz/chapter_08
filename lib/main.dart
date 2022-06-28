import 'package:flutter/material.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '转场动画',
      theme: ThemeData(
          primarySwatch: Colors.purple
      ),
      home: FirstPage(),
    );
  }
}

class CustomRoute extends PageRouteBuilder{

  final Widget widget;
  CustomRoute(this.widget) :super(
      transitionDuration:Duration(seconds: 1),
      pageBuilder:(
          BuildContext context,
          Animation<double> animation1,
          Animation<double> animation2,
          ){
        return widget;
      },
      transitionsBuilder:(
          BuildContext context,
          Animation<double> animation1,
          Animation<double> animation2,
          Widget child
          ){
        //缩放动画
        return ScaleTransition(
          //动画曲线为快出慢进
            scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)),
            //旋转动画
            child: RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)),
              child: child,
            )
        );
      }
  );
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第一页'),
        elevation: 6.0,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: MaterialButton(
          onPressed: (){
//            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SecondPage()));
            Navigator.of(context).push(CustomRoute(SecondPage()));
          },
          child: Text('点击进入下一页',style: TextStyle(fontSize: 25, color: Colors.black),),
          color: Colors.red,
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第二页'),
        elevation: 0.0,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: MaterialButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          child: Text('点击返回上一页',style: TextStyle(fontSize: 25, color: Colors.black),),
          color: Colors.green,
        ),
      ),
    );
  }
}


