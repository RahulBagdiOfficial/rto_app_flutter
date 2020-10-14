

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
class AnnouncementList extends StatefulWidget {
  @override
  _AnnouncementListState createState() => _AnnouncementListState();
}

class _AnnouncementListState extends State<AnnouncementList> {
  @override
  Widget build(BuildContext context) {

    final announcements = Provider.of<QuerySnapshot>(context);
    for (var doc in announcements.documents) {
      if(doc.data().values.isEmpty){
        return CircularProgressIndicator();
      } else {
        return Text(doc.data().values.toString(),
          style:  TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        );
      }

    }

  }
}

