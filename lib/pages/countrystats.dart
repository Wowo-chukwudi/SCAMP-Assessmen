import 'package:covid19_tracker/pages/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class CountryStats extends StatefulWidget {
  @override
  _CountryStatsState createState() => _CountryStatsState();
}

class _CountryStatsState extends State<CountryStats> {
  final String url = 'https://api.covid19api.com/summary';
  Future<List> data;

  Future<List> getData() async {
    var response = await Dio().get(url);
    return response.data['Countries'];
  }

  @override
  void initState() {
    data = getData(); // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: (){

            showSearch(context: context, delegate: Search(data));
            },)
          ],
          backgroundColor: Colors.blueGrey[900],
          title: Text(
            'COUNTRY STATS',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          child: FutureBuilder(
              future: data,
              // ignore: missing_return
              builder: (BuildContext context, Snapshot) {
                if (!Snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                  return Container(

                    child: ListView.builder(
                        //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2),
                        itemCount: 244,

                        itemBuilder: (BuildContext context, index) {
                          return Card(
                            child: Container(
                              height: 150,
                              padding: EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [BoxShadow(
                                    color: Colors.grey[400],
                                    blurRadius: 60,
                                    offset: Offset(0, 10)),
                                ],),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      child: Text('${Snapshot.data[index]['Country'].toString()}',
                                        style: TextStyle(color: Colors.blueGrey[900], fontSize: 21, fontWeight: FontWeight.bold),)
                                  ),

                                  Column(
                                    children: <Widget>[
                                      Text('New Confirmed Cases:  ${Snapshot.data[index]['NewConfirmed'].toString()}', style: TextStyle(fontSize: 15),),
                                      Text('Confirmed Cases:  ${Snapshot.data[index]['TotalConfirmed'].toString()}', style: TextStyle(fontSize: 15),),
                                      Text('Recovered:  ${Snapshot.data[index]['TotalRecovered'].toString()}', style: TextStyle(color: Colors.green, fontSize: 15),),
                                      Text('Deaths:  ${Snapshot.data[index]['TotalDeaths'].toString()}', style: TextStyle(color: Colors.red, fontSize: 15),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                  );
                //}
              }),
        ));
  }
}
