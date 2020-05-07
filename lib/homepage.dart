import 'dart:convert';

import 'package:covid19_tracker/datasource.dart';
import 'package:covid19_tracker/pages/countrystats.dart';
import 'package:covid19_tracker/panels/mostaffectedpanel.dart';
import 'package:covid19_tracker/panels/preventpanel.dart';
import 'package:covid19_tracker/panels/nigeriapanel.dart';
import 'package:covid19_tracker/panels/worldpanel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import 'datasource.dart';

  class HomePage extends StatefulWidget {
    @override
    _HomePageState createState() => _HomePageState();
  }
  
  class _HomePageState extends State<HomePage> {

    Map worldData;
    fetchWorldData()async{
      http.Response response= await http.get('https://api.covid19api.com/summary');
      setState(() {
        worldData =jsonDecode(response.body);
      });
    }


    List nigeriaData;
    fetchCountryData()async{
      http.Response response= await http.get('https://api.covid19api.com/live/country/nigeria/status/confirmed');
      setState(() {
        //Map<String, dynamic> map = json.decode(response.body);
        //List<dynamic> countryData = countryData[0];
        nigeriaData =jsonDecode(response.body);
      });
    }


    final String url = 'https://api.covid19api.com/summary?sort=TotalDeaths';
    Future<List> data;

    Future<List> getData() async {
      var response = await Dio().get(url);
      return response.data['Countries'];
    }


    @override
  void initState() {
    fetchWorldData();
    fetchCountryData();
    data = getData();
    super.initState();
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.white,
          title: Text('COVID-19 TRACKER', style: TextStyle(color: Colors.blueGrey[900])),
        ),
        body: SingleChildScrollView(child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
              child: Row(
                children: <Widget>[
                  Text('STAY', style: TextStyle(color: Colors.blueGrey[900], fontSize: 40, fontWeight: FontWeight.bold),),
                  Container(child: Text('SAFE', style: TextStyle(color: Colors.blueGrey[300], fontSize: 40, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),))
                ],
              ),
            ),

            LimitedBox(
              maxHeight: 150,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[

                    PreventPanel(imageUrl: 'images/hand.jpeg', title: 'Wash Hands Often'),
                    PreventPanel(imageUrl: 'images/cough.jpeg', title: 'Cover Your Cough'),
                    PreventPanel(imageUrl: 'images/home.jpeg', title: 'Stay home'),
                    PreventPanel(imageUrl: 'images/distance.jpeg', title: 'Keep a safe distance'),
                    PreventPanel(imageUrl: 'images/mask.jpeg', title: 'Wear mask outside'),
                    PreventPanel(imageUrl: 'images/sick.jpeg', title: 'Sick? Call ahead'),
                  ]
              ),
            ),

              Padding(padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text('Nigeria', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>CountryStats()));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: primaryBlue,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      padding: EdgeInsets.all(3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('All Country Stats', style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold),),
                          Icon(Icons.arrow_forward, color: Colors.white,)
                        ],
                      )),
                ),
              ],
            ),
            SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: nigeriaData==null?CircularProgressIndicator():NigerPanel(nigeriaData: nigeriaData),
                )
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0)),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text('Worldwide', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  ),
                ],
              ),

            Padding(padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0)),

              worldData==null?CircularProgressIndicator():WorldPanel(worldData: worldData,),




            //Padding(padding: const EdgeInsets.all(10)),

            Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('Most Affected Countries', style: TextStyle(color: Colors.blueGrey[900], fontWeight: FontWeight.bold, fontSize: 25))),
            data==null?CircularProgressIndicator():MostAffected(data: data,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  //borderRadius: BorderRadius.circular(20),
                ),
                //margin: EdgeInsets.symmetric(horizontal: 40),
                height: 100,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(DataSource.quote, style: TextStyle(color: Colors.blueGrey[900], fontSize: 15, fontWeight: FontWeight.w900),),
              ),
            ),


            Padding(
                padding: const EdgeInsets.all(10.0),
               child: Text('TOGE--THER WE WILL BEAT THIS!', style: TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold, fontSize: 20)))

          ],
        )),
      );
    }
  }
  