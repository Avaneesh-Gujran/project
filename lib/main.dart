import 'package:flutter/material.dart';
import 'package:project/start_screen.dart';
void main() {
  runApp(MainPage());
}




class MainPage extends StatefulWidget{
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{
  bool isLoading = false;

  @override
  Widget build(BuildContext context){
    return MaterialApp(
        home: LoadingPage()
      
    );
    
  }
    
}
