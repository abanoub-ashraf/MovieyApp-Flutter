import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
    const AppWidget({ Key? key }) : super(key: key);
                                         
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
                primarySwatch: Colors.green,
                visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: Container(),
        );
    }
}