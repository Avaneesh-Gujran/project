import 'package:flutter/material.dart';
import 'package:project/start_screen.dart';
import 'dart:math' as math;
import 'home.dart';
import 'main.dart';

import 'package:project/sizes_helpers.dart';

Size displaySize(BuildContext context) {
  debugPrint('Size = ' + MediaQuery.of(context).size.toString());
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  debugPrint('Height = ' + displaySize(context).height.toString());
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  debugPrint('Width = ' + displaySize(context).width.toString());
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

  _navigatetohome()async{
  await Future.delayed(Duration(seconds: 3),() {});
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home()));

  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    final widthforImg = displayWidth(context)*0.1;
    return AnimatedBuilder(
      animation: _controller,
      child : Container(
        
        
        child: SizedBox(
          height: widthforImg,
          width: 30,
          child: Image.asset(
          'newlogo.jpeg',
          height: widthforImg,
          width: widthforImg,
        ),)
        
      ),

      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _controller.value * 2.0 * math.pi,
          child: child,
        );
      },
    );
  }

}
