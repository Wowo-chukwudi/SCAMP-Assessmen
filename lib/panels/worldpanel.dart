import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

  class WorldPanel extends StatelessWidget {
    final Map worldData;

  const WorldPanel({Key key, this.worldData}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Container(
        child: GridView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2),
            children: <Widget>[
              StatusPanel(
                title: 'NEW CASES',
                panelColor: Colors.blue[100],
                textColor: Colors.blue,
                count: worldData['Global']['NewConfirmed'].toString()
              ),
              StatusPanel(
                  title: 'CONFIRMED',
                  panelColor: Colors.orange[100],
                  textColor: Colors.orange,
                  count: worldData['Global']['TotalConfirmed'].toString()
              ),
              StatusPanel(
                  title: 'RECOVERED',
                  panelColor: Colors.green[100],
                  textColor: Colors.green,
                  count: worldData['Global']['TotalRecovered'].toString()
              ),
              StatusPanel(
                  title: 'DEATHS',
                  panelColor: Colors.red[100],
                  textColor: Colors.red,
                  count: worldData['Global']["TotalDeaths"].toString()),
          ],
        ),
        );
    }
  }
  class StatusPanel extends StatelessWidget {

     //final Color panelColor;
     final Color textColor;
     final String title;
     final String count;
     final Color panelColor;

  const StatusPanel({Key key, this.panelColor, this.textColor, this.title, this.count}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      double width = MediaQuery.of(context).size.width;

      return Container(
        decoration: BoxDecoration(
          color: panelColor,
          //borderRadius: BorderRadius.circular(10),
          //border: Border.all(color: panelColor)
        ),
        margin: EdgeInsets.all(10),
        height: 80, width: width/2,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),),
            Text(count, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
          ],
        ),
      );
    }
  }


//Container(
//width: 160.0,
//color: Colors.blue,
//),
