import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};


  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
    print(data);

    String bgImage = data['isDayTime'] ? 'dayTime.png' : 'nightTime.png'; 
    Color? bgColor = data['isDayTime'] ? Colors.blue : Colors.blue[900];

    
    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,100,0,0),
              child: Column(
                children: [
                    Center(
                      child: TextButton.icon(
                        onPressed: () async {
                          dynamic result = await Navigator.pushNamed(context, '/location');
                          setState(() {
                            data = {
                              'location' : result['location'],
                              'flag' : result['flag'],
                              'time' : result['time'],
                              'isDayTime' : result['isDayTime']
                            };
                          });
                        },
                        label : Text(
                          'Change location',
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                        icon : Icon(
                          Icons.edit_location,
                          color: Colors.grey[500],
                        )
                      ),
                    ),
                  SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                          style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 3.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Text(data['time'],style: TextStyle(
                    fontSize: 60.0,
                    color: Colors.white,
                  ),)
                ],
              ),
            ),
          ),
        ),
      );
  }
}