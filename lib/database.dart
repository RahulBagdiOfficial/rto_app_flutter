import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  
  //collection reference
  final CollectionReference announcementCollection = FirebaseFirestore.instance.collection('Information');
  
  
  //get announcements
  Stream<QuerySnapshot> get announcements {
    return announcementCollection.snapshots();
  }
}