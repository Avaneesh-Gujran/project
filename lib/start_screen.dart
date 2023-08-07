import 'package:flutter/material.dart';
import 'package:project/loading_screen.dart';
import 'start_screen.dart';
import 'dart:math' as math;
import 'home.dart';
import 'main.dart';

import 'sizes_helpers.dart';

Size displaySize(BuildContext context) {
  debugPrint('Size = ${MediaQuery.of(context).size}');
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  debugPrint('Height = ${displaySize(context).height}');
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  debugPrint('Width = ${displaySize(context).width}');
  return displaySize(context).width;
}

class LoadingPage extends StatefulWidget{
  // ignore: avoid_types_as_parameter_names
  const LoadingPage({Key? key}):super(key: key);

  @override
  _LoadingPage createState() => _LoadingPage();

}

class _LoadingPage extends State<LoadingPage> with TickerProviderStateMixin{
  late  AnimationController _controller;
  late  AnimationController _controllerTwo;

  @override
  void initState(){
    super.initState();
    _navigatetohome();
     _controller = AnimationController(
    duration: const Duration(seconds: 4,milliseconds: 500),
    vsync: this,
  );


    _controllerTwo = 
AnimationController(
    duration: const Duration(seconds: 2,milliseconds: 0),
    vsync: this,
  );
  _controllerTwo.animateBack(1,duration: Duration(seconds: 1));

  _controller.repeat();
  

    
  }

  
  _navigatetohome(){
  Future.delayed(const Duration(seconds: 4,milliseconds: 500),() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoadingScreen()));
  });
  

  }

  

  late final Animation<Offset> _offsetAnimation  = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(-0.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controllerTwo,
    curve: Curves.elasticIn,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    final widthforImg = displayWidth(context)*0.3;
    print("this is the width: "+widthforImg.toString());

    return 
    Scaffold(
      body: 
    
    
    Center(
      child: SlideTransition(
        position: _offsetAnimation,
        child:
      AnimatedBuilder(
        animation: _controller,
        
        child : SizedBox(
          
          width: widthforImg,
          child:  Image.asset(
          'assets/thelogo.png',
          
          width: widthforImg,
          fit: BoxFit.contain,
    
        ),),
    
        builder: (BuildContext context, Widget? child) {
          return Transform.rotate(
            angle: _controller.value * 4.0 * math.pi,
            child: child,
          );
        }
        
        ,
      ),
    )
    ),);
  }
  
}

