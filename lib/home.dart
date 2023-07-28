import 'package:flutter/material.dart';
class Home extends StatefulWidget{

  const Home({Key?key}):super(key:key);

  @override
  _Home createState() => _Home(); 

}

class _Home extends State<Home>{
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 255, 0),
      body: Center(child: const Text( 
        "Home Page",
        textDirection: TextDirection.ltr, 
      ),)
    );
  }

}