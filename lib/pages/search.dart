import 'dart:async';
import 'dart:core';

import 'package:covid19_tracker/pages/countrystats.dart';
import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  final Future<List> countryList;

  Search(this.countryList);

  @override

  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: () {
        query = '';
      }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
      Navigator.pop(context);
    },);
  }

  @override
  Widget buildResults(BuildContext context) {

  }

  @override
  Widget buildSuggestions(BuildContext context) {
     //TODO: implement buildSuggestions
return Container();
    //final suggestionList = query.isEmpty?countryList: countryList.where;
//  return FutureBuilder(
//      future: countryList,
//      // ignore: missing_return
//      builder: (BuildContext context, Snapshot) {
//        if (!Snapshot.hasData) {
//          return CircularProgressIndicator();
//        }
//        return Container(
//
//            child: ListView.builder(
//              //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2),
//              itemCount: 244,
//
//              itemBuilder: (BuildContext context, index) {
//                return Card(
//                  child: Container(
//                    height: 150,
//                    padding: EdgeInsets.all(15.0),
//                    decoration: BoxDecoration(
//                      color: Colors.white,
//                      boxShadow: [BoxShadow(
//                          color: Colors.grey[400],
//                          blurRadius: 60,
//                          offset: Offset(0, 10)),
//                      ],),
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                      //crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Container(
//                            child: Text('${Snapshot.data[index]['Country']
//                                .toString()}',
//                              style: TextStyle(color: Colors.blueGrey[900],
//                                  fontSize: 21,
//                                  fontWeight: FontWeight.bold),)
//                        ),
//
//                        Column(
//                          children: <Widget>[
//                            Text('New Confirmed Cases:  ${Snapshot
//                                .data[index]['NewConfirmed'].toString()}',
//                              style: TextStyle(fontSize: 15),),
//                            Text('Confirmed Cases:  ${Snapshot
//                                .data[index]['TotalConfirmed'].toString()}',
//                              style: TextStyle(fontSize: 15),),
//                            Text('Recovered:  ${Snapshot
//                                .data[index]['TotalRecovered'].toString()}',
//                              style: TextStyle(
//                                  color: Colors.green, fontSize: 15),),
//                            Text('Deaths:  ${Snapshot.data[index]['TotalDeaths']
//                                .toString()}', style: TextStyle(
//                                color: Colors.red, fontSize: 15),),
//                          ],
//                        ),
//                      ],
//                    ),
//                  ),
//                );
//              },
//            )
//        );
//      }
//    );
  }

  }
