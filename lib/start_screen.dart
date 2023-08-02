import 'package:flutter/material.dart';
import 'package:project/start_screen.dart';
import 'dart:math' as math;
import 'home.dart';
import 'main.dart';

import 'package:project/sizes_helpers.dart';

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
  @override
  void initState(){
    super.initState();
    _navigatetohome();

    
  }

  
  _navigatetohome(){
  Future.delayed(const Duration(seconds: 4,milliseconds: 500),() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Home()));
  });
  

  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 4,milliseconds: 500),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    final widthforImg = displayWidth(context)*0.3;
    print("this is the width: "+widthforImg.toString());

    return Scaffold(
      body: 
    
    
    Center(
      child: AnimatedBuilder(
        animation: _controller,
        
        child : SizedBox(
          
          width: widthforImg,
          child: Image.asset(
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
    );
  }
  
}
