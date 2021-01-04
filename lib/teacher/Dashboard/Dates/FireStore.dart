import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dat.dart';

final CollectionReference myCollection = FirebaseFirestore.instance.collection('dates');

class FirestoreService {
  
  Future<Task> createTODOTask(String taskname, String taskdetails,String taskdate,String tasktime) async {
      final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(myCollection.doc());

      final Task task = new Task(taskname, taskdetails,taskdate,tasktime);
      final Map<String, dynamic> data = task.toMap();
      tx.set(ds.reference, data);
      return data;
    };

    return FirebaseFirestore.instance.runTransaction(createTransaction).then((mapData) {
      return Task.fromMap(mapData);
    }).catchError((error) {
      print('error: $error');
      return null;
    });
  }

  Stream<QuerySnapshot> getTaskList({int offset, int limit}) {
    Stream<QuerySnapshot> snapshots = myCollection.snapshots();

    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }
    if (limit != null) {
      snapshots = snapshots.take(limit);
    }
    return snapshots;
  }

  
}