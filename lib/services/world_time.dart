import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  late String time;
  String flag;
  String url;
  late bool isDayTime;


  WorldTime(this.location,this.flag,this.url);

  Future<void> getTime() async{
  try {
    //Future is like a Promise in JS  ; 

  
    String api = 'https://worldtimeapi.org/api/timezone/$url';
    Response response = await get(Uri.parse(api));
    Map data = jsonDecode(response.body);

    //print(data);

    String dateTime = data['datetime'];
    String utc_offset = data['utc_offset'].substring(0,3);

    // print(dateTime);
    // print(utc_offset);

    DateTime now = DateTime.parse(dateTime);
    // print(now);
    // print(now.hour);
    now = now.add(Duration( hours : int.parse(utc_offset)));
    // print(now);

    // time = now.toString();
    print(now.hour);
    isDayTime = now.hour>6 && now.hour <20 ? true : false;

    print(" timito $isDayTime");
    time = DateFormat.jm().format(now); // Format date using intL Package ;
    //print('time : $time ');

  } catch (e) {
    print("error while processing this request : $e");
    time = 'Error : couldn\'t find data ! '; 
  }


  
  }
}