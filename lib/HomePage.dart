import 'package:cached_network_image/cached_network_image.dart';
import 'package:contactapp/helpers/Constants.dart';
import 'package:contactapp/models/Record.dart';
import 'package:contactapp/models/RecordList.dart';
import 'package:contactapp/models/RecordService.dart';
import 'package:flutter/material.dart';

import 'DetailPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  RecordList _recordList = new RecordList(null);
  RecordList _filterRecordList = new RecordList(null);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _recordList.list = new List();
    _filterRecordList.list = new List();
    _getRecords();
  }

  void _getRecords() async {
    RecordList recordList = await RecordService().loadRecords();
    setState(() {
      for (Record record in recordList.list) {
        this._recordList.list.add(record);
        this._filterRecordList.list.add(record);
      }
    });
  }

  Widget _buildList(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      children: this
          ._filterRecordList
          .list
          .map((data) => _buildListItem(context, data))
          .toList(),
    );
  }

  Widget _buildListItem(BuildContext context, Record record) {
    return Card(
      key: ValueKey(record.name),
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(64, 75, 96, .9),
            borderRadius: BorderRadius.circular(4)),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right:
                          new BorderSide(width: 1.0, color: Colors.white24))),
              child: Hero(
                  tag: "avatar_" + record.name,
                  child: CircleAvatar(
                    radius: 32,
                    backgroundImage:
                        new CachedNetworkImageProvider(record.photo),
                  ))),
          title: Text(
            record.name,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Nexa',
                fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: <Widget>[
              new Flexible(
                  child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: record.address,
                        style:
                            TextStyle(color: Colors.white, fontFamily: 'Nexa'),
                      ),
                      maxLines: 3,
                      softWrap: true,
                    )
                  ]))
            ],
          ),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => new DetailPage(record: record)));
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: appPrimaryGreyColor,
      appBar: _buildBar(),
      body: _buildList(context),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget _buildBar() {
    return new AppBar(
        elevation: 4.0,
        centerTitle: true,
        backgroundColor: toolBarColor,
        title: Text(
          appTitle,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Nexa',
              fontWeight: FontWeight.w700),
        ),
        automaticallyImplyLeading: false);
  }
}
