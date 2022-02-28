import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  const ChooseLocation({ Key? key }) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


    List<WorldTime> locations = [
      WorldTime('Casablanca','maroc.png','Africa/Casablanca'),
      WorldTime('London','uk.png','Europe/London'),
      WorldTime('Athens','greece.png','Europe/Berlin',),
      WorldTime('Cairo','egypt.png','Africa/Cairo',),
      WorldTime('Nairobi','kenya.png','Africa/Nairobi',),
      WorldTime('Chicago','usa.png','America/Chicago',),
      WorldTime('New York','usa.png','America/New_York',),
      WorldTime('Seoul','south_korea.png','Asia/Seoul'),
      WorldTime('Jakarta','indonesia.png','Asia/Jakarta',)
    ];


  void updateTime(index) async{
    //print(locations[index].url);

    await locations[index].getTime();
    Navigator.pop(context,{
      'location' : locations[index].location,
      'flag' : locations[index].flag,
      'time' : locations[index].time,
      'isDayTime' : locations[index].isDayTime
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
          shadowColor: Colors.blue[700],
          title: Text('Choose location page'),

        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(   //Check documentation
            itemCount: locations.length,
            itemBuilder: (context,index){
              return Card(
                child: ListTile(
                  onTap: (){
                    //print(locations[index].url);
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              );
            },
          ),
        ),
    );
  }
}
