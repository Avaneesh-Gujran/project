import 'package:flutter/material.dart';
import 'package:project/home.dart';
import 'package:project/random.dart';
import 'sizes_helpers.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget{
  

  const LoadingScreen({Key?key}):super(key:key);

  @override
  
  _LoadingScreen createState() => _LoadingScreen(); 

}







class _LoadingScreen extends State<LoadingScreen> with TickerProviderStateMixin {
  

  late AnimationController _controller;
  late Animation<double> _animation;
  

  @override
  dispose(){
    _controller.dispose();
    super.dispose();
    
  }

  @override
  void initState() {
    // TODO: implement initState
     _controller = AnimationController(vsync: this,
    duration: const Duration(seconds: 4),);
    
     _animation = CurvedAnimation(parent: _controller,curve: Curves.easeInCirc,
    );
    _controller.forward(from: 0,);
    _navigatetoLoadingScreen();
    
    
  }

  _navigatetoLoadingScreen(){
  Future.delayed(const Duration(seconds: 4,milliseconds: 500),() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
  });
  

  }

  


  

  

  




  @override
  Widget build(BuildContext context){
    final widthforImg = displayWidth(context)*0.3;
    return ColoredBox(color: Colors.white,
    
   
      child:Scaffold(body:  Column(
        mainAxisSize: MainAxisSize.max
      ,mainAxisAlignment: MainAxisAlignment.center ,
        children:  [Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
          
          width: widthforImg,
          child: Image.asset(
            
          'assets/thelogo.png',
          fit: BoxFit.contain,
          
        )

        
        
        ,
      
        
      ),
      FadeTransition(
      opacity: _animation,
      child:SizedBox(
          
          width: widthforImg,
          child: Image.asset(
            
          'assets/nds_logo 1.png',
          fit: BoxFit.contain,
          
        )

        
        
        ,
      
        
      )
        )]
        )]
      
      
      ,)),
    
    );
  }
  
  

}