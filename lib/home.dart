import 'package:flutter/material.dart';
import 'package:project/sizes_helpers.dart';
class Home extends StatefulWidget{
  

  const Home({Key?key}):super(key:key);

  @override
  
  _Home createState() => _Home(); 

}







class _Home extends State<Home> with TickerProviderStateMixin {
  

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