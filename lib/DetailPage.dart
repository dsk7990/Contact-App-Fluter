import 'package:contactapp/helpers/Constants.dart';
import 'package:contactapp/helpers/URLLaucher.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'models/Record.dart';

class DetailPage extends StatelessWidget {
  Record record;

  DetailPage({this.record});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: _appBar(),
      body: new ListView(
        children: <Widget>[
          Hero(
              tag: "avatar_" + record.name,
              child: new Image.network(record.photo)),
          GestureDetector(
            onTap: () {
//              Fluttertoast.showToast(
//                  msg: 'hello',
//                  toastLength: Toast.LENGTH_SHORT,
//                  timeInSecForIos: 1);
//              URLLauncher().launchUrl(record.url);
              _showDialog(context);
            },
            child: Container(
                padding: EdgeInsets.all(10),
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new Column(
                      children: <Widget>[
                        Text(
                          record.name,
                          style: TextStyle(
                              fontFamily: 'Nexa', fontWeight: FontWeight.bold),
                        ),
                        Text(record.address)
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    )),
                    GestureDetector(
                      onTap: () {
                        Fluttertoast.showToast(
                          msg: "TAPPED",
                          toastLength: Toast.LENGTH_SHORT,
                          timeInSecForIos: 1,
                        );
                        URLLauncher().launchTel(record.contact);
                      },
                      child: new Container(
                        child: new Row(
                          children: <Widget>[
                            new Icon(Icons.phone, color: Colors.red),
                            Text(record.contact),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }

  Widget _appBar() {
    return new AppBar(
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        record.name,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nexa'),
      ),
      backgroundColor: toolBarColor,
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctxt) => new AlertDialog(
              elevation: 4.0,
              title: Text('Simple Dialog'),
              content: Text('This is a Content Area.'),
              actions: <Widget>[
                RaisedButton(
                  onPressed: () => {Navigator.pop(context), print("pressed")},
                  child: Text(
                    'OK',
                    style: TextStyle(color: toolBarColor),
                  ),
                )
              ],
            ));
  }
}
