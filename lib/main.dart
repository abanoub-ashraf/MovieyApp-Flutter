import 'package:flutter/material.dart';
import 'package:moviey_app/app/app_widget.dart';

///
/// - the layers of the apps are presentation, domain and data
/// 
/// - presentation layer is the ui
/// 
/// - presentation layer is combination of widgets that makes a screen 
///   and the screen is called a journey
/// 
/// - data layer is responsible for bringing data from outside world like a rest api
/// 
/// - domain layer acts as a communication channel between the presentation layer 
///   and the data layer
/// 
/// - presentation and data layers both depend on the domain layer and they never interact
///   with each other
/// 
/// - common folder contains constants, extensions and utils in general
///
                                       
void main() => runApp(
    const AppWidget()
);