import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({ Key? key }) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  //String time = 'loading';


  void setupWorldTime() async{
      WorldTime worldTime = WorldTime('Berlin', 'germany.png', 'Europe/Berlin');
      await worldTime.getTime();
      // print(worldTime.time);
      // setState(() {
      //   time = worldTime.time;
      // });

      Navigator.pushReplacementNamed(context, '/home',arguments: {
        'location' : worldTime.location,
        'flag' : worldTime.flag,
        'time' : worldTime.time,
        'isDayTime' : worldTime.isDayTime
      });
    }

  @override
  void initState(){
    super.initState();
    // print("hello init state ");
    setupWorldTime();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor : Colors.blue[400],
      body :
        // child: Text('$time'),
        Center(
          child: SpinKitCubeGrid(
            color: Colors.white,
            size: 50.0,
          ),
        )
    );
  } 
}