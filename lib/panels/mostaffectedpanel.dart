import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MostAffected extends StatelessWidget{
  //final String url = 'https://api.covid19api.com/summary';
  final Future<List> data;

  const MostAffected({Key key, this.data}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: FutureBuilder(
        future: data,
        builder: (BuildContext context, Snapshot) {
          if (!Snapshot.hasData) {
            return CircularProgressIndicator();
          };
          return Container(
              child: ListView.builder(
                shrinkWrap: true,
                  itemCount: 5,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, index){
                    return Container(
                        color: Colors.blueGrey[100],
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('${Snapshot.data[index]['Country'].toString()}:',
                          style: TextStyle(color: Colors.blueGrey[900], fontWeight: FontWeight.bold, fontSize: 15),),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text('Total Confirmed: ${Snapshot.data[index]['TotalConfirmed'].toString()}',),
                              Text('Deaths: ${Snapshot.data[index]['TotalDeaths'].toString()}',
                              style: TextStyle(color: Colors.red),)
                            ],
                          )
                        ],
                      ),
                    );
                  },
              ),
          );
        },
      ),


    );
  }

}