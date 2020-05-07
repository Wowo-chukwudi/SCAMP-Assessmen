import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NigerPanel extends StatelessWidget {

  final List nigeriaData;

  const NigerPanel({Key key, this.nigeriaData}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        //gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2, crossAxisSpacing: 9),
        itemBuilder: (context, index){
          return Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              StatusPanel(
                                  title: 'CONFIRMED',
                                  panelColor: Colors.white,
                                  textColor: Colors.blue,
                                  count: nigeriaData[index]['Confirmed'].toString()
                              ),
                              StatusPanel(
                                  title: 'ACTIVE',
                                  panelColor: Colors.white,
                                  textColor: Colors.orange,
                                  count: nigeriaData[index]['Active'].toString()
                              ),
                              StatusPanel(
                                  title: 'RECOVERED',
                                  panelColor: Colors.white,
                                  textColor: Colors.green,
                                  count: nigeriaData[index]['Recovered'].toString()
                              ),
                              StatusPanel(
                                  title: 'DEATHS',
                                  panelColor: Colors.white,
                                  textColor: Colors.red,
                                  count: nigeriaData[index]['Deaths'].toString()
                              ),
                            ],
                          ),
            );
        },

     itemCount: 1,
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
          color: Colors.white,
          //borderRadius: BorderRadius.circular(10),
          border: Border.all(color: panelColor)
      ),
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 50, //width: 100,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: textColor),),
          Text(count, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}


//Container(
//width: 160.0,
//color: Colors.blue,
//),
