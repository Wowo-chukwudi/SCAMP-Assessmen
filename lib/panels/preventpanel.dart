import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreventPanel extends StatelessWidget {
  final String imageUrl;
  final String title;

  const PreventPanel({Key key, this.imageUrl, this.title,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                    imageUrl,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 90,
                  fit: BoxFit.fitWidth
                ),
              ),
              SizedBox(width: 30),

              Flexible(child: Text(title, style: TextStyle(color: Colors.blueGrey[900], fontWeight: FontWeight.bold, fontSize: 18)),),
            ],
          ),
        ),
      ),

    );
  }
}
