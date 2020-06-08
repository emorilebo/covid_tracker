import 'package:covidtracker/datasource.dart';
import 'package:covidtracker/homepage.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Circular',
      primaryColor:primaryBlack,
    ),
    home: HomePage(),
  ),);
}