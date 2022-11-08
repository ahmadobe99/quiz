import 'package:flutter/material.dart';
import 'package:quis/writing_view.dart';


void main(){
 runApp(MaterialApp(home:
   MyApp(),)) ;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WritingView ();
  }
}